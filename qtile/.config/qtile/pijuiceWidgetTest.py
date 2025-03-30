import datetime
import json
from libqtile.widget import base
from pijuice import PiJuice

class BatteryWidget(base._TextBox):
  def __init__(self,
               refresh_rate,
               gpio_bus=1,
               gopio_pin=0x14,
               log_file="./battery.log"):
    super().__init__()
    self.refresh_rate = refresh_rate
    self.gpio_bus = gpio_bus
    self.gpio_pin = gopio_pin
    self.log_file = log_file

  def timer_setup(self):
    self.timeout_add(self.refresh_rate, self.update)

  def _configure(self, qtile, bar):
    super()._configure(qtile, bar)
    self.width = bar.width

  def battery_left(self):
    try:
      with open(self.log_file, 'r') as file:
        lines = file.readlines()
        sum_val = 0
        for line in lines:
          log_list = line.split('-')[1]
          log_list = json.loads(log_list)
          if 'chargeLevel' in log_list:
            # compute time left in battery
            sum_val += int(log_list['chargeLevel'])
            #for test :
            #sum_val = log_list
        return sum_val
    except FileNotFoundError:
      return 0

  def button_press(self, x, y, button):
    if button == 1:  # Left mouse button
      self.show_popup(f"Battery left: {self.battery_left()}")

  def show_popup(self, content):
    # code to show the popup
    # Example using qtile's built-in notify widget:
    self.qtile.widgets_map['notify'].show(content)

  # Log battery entries
  def write_log(self, log_list, num_entries_to_keep):
    # write new value
    with open(self.log_file, 'a') as file:
      file.write(f"{datetime.datetime.now()} - {log_list}\n")

    # check if max log size is reached
    with open(self.log_file, 'r') as file:
      lines = file.readlines()
      if len(lines) > num_entries_to_keep:
        with open(self.log_file, 'w') as file:
          file.writelines(lines[-num_entries_to_keep:])

  def battery_icon(self, charge, charging):
    icon = {
        100: ('0xF0079', '0xF0085'),
        90: ('0xF0082', '0xF008B'),
        80: ('0xF0081', '0xF008A'),
        70: ('0xF0080', '0xF089E'),
        60: ('0xF007F', '0xF0089'),
        50: ('0xF007E', '0xF089D'),
        40: ('0xF007D', '0xF0088'),
        30: ('0xF007C', '0xF0087'),
        20: ('0xF007B', '0xF0086'),
        10: ('0xF007A', '0xF089C')
    }
    closest = icon.get(charge) or icon[min(icon.keys(),
                                           key=lambda key: abs(key - charge))]
    return chr(int(closest[charging], 16))

  def poll(self):
    battery = PiJuice(self.gpio_bus, self.gpio_pin)
    chargeLevel = battery.status.GetChargeLevel()
    status = battery.status.GetStatus()['data']
    charging = 1 if status['battery'] == 'CHARGING_FROM_IN' else 0
    output = str(chargeLevel['data']) + '%'
    output += battery_icon(chargeLevel['data'], charging)
    status['chargeLevel'] = chargeLevel
    self.write_log(status, 100)
    return output
