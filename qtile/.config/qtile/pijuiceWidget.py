#!/usr/bin/python3

from pijuice import PiJuice

def pijuiceBattery(bus=1,pin=0x14):
    pj = PiJuice(bus,pin)
    chargeLevel = pj.status.GetChargeLevel()
    status = pj.status.GetStatus()['data']
    charging = 1 if status['battery'] == 'CHARGING_FROM_IN' else 0
    output = str(chargeLevel['data']) + '%'
    output += battery_icon(chargeLevel['data'], charging)
    return output

def battery_icon(charge,charging):
    icon={
        100:('0xF0079','0xF0085'),
        90 :('0xF0082','0xF008B'),
        80 :('0xF0081','0xF008A'),
        70 :('0xF0080','0xF089E'),
        60 :('0xF007F','0xF0089'),
        50 :('0xF007E','0xF089D'),
        40 :('0xF007D','0xF0088'),
        30 :('0xF007C','0xF0087'),
        20 :('0xF007B','0xF0086'),
        10 :('0xF007A','0xF089C')
    }
    closest=icon.get(charge) or icon[min(icon.keys(), key = lambda key: abs(key-charge))]
    return chr(int(closest[charging],16))

# Test
#print(pijuiceBattery(bus=0))
#print(PiJuice(0,0x14).status.GetStatus()['data'])
#print(PiJuice(0,0x14).status.GetStatus()['data']['battery'])
