import pyautogui
import time

'''Declarando'''

def actionClick(posicao_x,posisao_y,tempo,qtd):
    time.sleep(tempo)
    pyautogui.moveTo(posicao_x,posisao_y)
    for i in range(qtd):
        time.sleep(tempo)
        pyautogui.click()

def actionWrite(texto):
    pyautogui.write(texto,interval=0.1)  

def inserirItem(nome,qtd):
    #pesquisarProduto
    actionClick(1135,201,1,1) # selecionar pesquisa
    actionWrite(nome) 
    if qtd > 5:
        #primeira Rotina
        actionClick(1110,271,1,1) # selecionar Item
        actionClick(1096,261,1,1)  # selecionar quantidade
        actionWrite(str(qtd))
        actionClick(1296,154,1,1) # salvar o item
    else:
        #Segunda rotina
        actionClick(1280,280,1,qtd) #clickar quantas vezes for nessario na quantidade.
    #Limpar consulta
    actionClick(1241,195,1,1)
    print('Produto '+nome+' inserido.')

def salvarItens():
    actionClick(897,99,1,1)          
    
'''Inicializando'''

#minimizar Visual Studio Code
actionClick(1257,13,1,1)

inserirItem('FOLHAS DE LOURO 5G',8)   
inserirItem('TEMPERO BAIANO 20G',30)   
inserirItem('PAPRICA DOCE 17G',40)   
inserirItem('CAMOMILA 120G',3)    
inserirItem('CEBOLINHA VERDE DESIDRATADA 7G',10)   
inserirItem('SAL GROSSO BRANCO SH 1KG',24)  
inserirItem('CHIMICHURRI SEM PIMENTA VD 70G',12)    
inserirItem('HORTELA 7G',15) 
inserirItem('HIBISCO FLOR 40G',15)  
inserirItem('CHIMICHURRI SEM PIMENTA 15G',30)   
inserirItem('BICARBONATO DE SODIO 30G',45)
inserirItem('TEMPERO PARA CHURRASCO SH 500G (SAL GROSSO TEMP)',15)
inserirItem('CAPIM CIDREIRA 10G',20)
inserirItem('FAROFA CAIPIRA CROCANTE APIMENTADA PT FT 220G',10)
inserirItem('PIMENTA DO REINO MOIDA 250G',12)
inserirItem('COLORAU VD 100G',60)
inserirItem('PAPRICA PICANTE 20G',20)
inserirItem('SAL AMONIACO 60G ',12)
inserirItem('PIMENTA DO REINO GRAOS 40G',20)
inserirItem('LEMON PEPPER 30G',10)
inserirItem('COMINHO MOIDO VD 100G',12)
inserirItem('NOZ MOSCADA 2UN',10)
inserirItem('SAL AMARGO 70G - CAIXINHA (SULFATO DE MAGNESIO)',8)
inserirItem('BOLDO 20G',12)
inserirItem('TEMPERO SIRIO (PIMENTA SIRIA) 30G',10)
inserirItem('FAROFA CAIPIRA CROCANTE SEM PIMENTA PT FT 220G',10)
inserirItem('CONFEITO MICANGA 20G',8)
inserirItem('COENTRO MOIDO 15G',20)
inserirItem('COLORAU 500G',24)
inserirItem('GENGIBRE MOIDO 15G',15)
inserirItem('ACAFRAO 30G',30)
inserirItem('ALHO FRITO CROCANTE 100G',15)
inserirItem('CHIMICHURRI COM PIMENTA 15G',30)
inserirItem('ALHO PORO 8G',20)
inserirItem('PIMENTA DO REINO MOIDA 20G',50)
inserirItem('ACAFRAO VD 100G',40)
inserirItem('REGANO VD 30G',50)
inserirItem('SALVIA EM FOLHAS DESIDRATADAS 7G',15)
inserirItem('SAL ROSA DO HIMALAIA MOIDO SH 500G',12)
inserirItem('CANELA EM CASCA 10G',10)
inserirItem('CONFEITO CHOCOLATE VD 120G',10)
inserirItem('PIMENTA DO REINO GRAOS 20G',24)
inserirItem('REGANO 5G',50)
inserirItem('NOZ MOSCADA MOIDA 10G',10)
inserirItem('CEBOLA DESIDRATADA EM FLOCOS 10G',10)
inserirItem('TEMPERO ALHO E SAL PT 300G',12)
inserirItem('TEMPERO PARA CARNES 50G',20)
inserirItem('CURRY 15G',12)
inserirItem('SAL AMONIACO 40G (BICARBONATO DE AMONIA)',30)
inserirItem('FARINHA DE MANDIOCA BRANCA PT BP 440G',12)
inserirItem('TEMPERO PARA ARROZ E FRANGO 50G',15)
inserirItem('CHIMICHURRI COM PIMENTA VD 70G',15)
inserirItem('ALECRIM VD 35G',12)
inserirItem('FOLHAS DE SENE 5G',10)
inserirItem('PIMENTA DO REINO MOIDA VD 100G',36)
inserirItem('CREME DE CEBOLA 15G',10)
inserirItem('COLORAU 40G',50)
inserirItem('MANJERICAO 10G',12)
inserirItem('BICARBONATO DE SODIO VD 100G',12)
inserirItem('CAMOMILA 5G',15)
inserirItem('SEMENTE DE CHIA 100G',12)
inserirItem('ALECRIM 10G',15)
inserirItem('TEMPERO CASEIRO PT 1KG',12)
inserirItem('CANELA EM CASCA VD 70G',8)
inserirItem('ALECRIM MOIDO 15G',35)

