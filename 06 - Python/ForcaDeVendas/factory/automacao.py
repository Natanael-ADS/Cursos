import pyautogui
import time

class Automacao:
    def actionClick(self,posicao_x,posisao_y,qtd = 1,tempo = 1):
        time.sleep(tempo)
        pyautogui.moveTo(posicao_x,posisao_y,1)
        for i in range(qtd):
            time.sleep(tempo)
            pyautogui.click()

    def actionWrite(self,texto,tempo = 1):
        time.sleep(tempo)
        pyautogui.write(texto,interval=0.1)  

    def Iniciar(self):
        self.actionClick(1257,13,1,1)

    def moverTela(self,posicao_x,posisao_y,subir_descer):
        pyautogui.moveTo(posicao_x,posisao_y,1)
        pyautogui.dragTo(posicao_x,subir_descer,1)
    
    def alerta(self, texto):
        pyautogui.alert(texto)
    