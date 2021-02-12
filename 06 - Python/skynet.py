import pyautogui
import time

#print(pyautogui.position())


pyautogui.keyDown('win')
pyautogui.press('r')
pyautogui.keyUp('win')

time.sleep(1)
#pyautogui.click(123,516)
pyautogui.press('\\')
pyautogui.press('\\')
pyautogui.write('192.168.0.200',interval=0.1)
pyautogui.hotkey('enter')


