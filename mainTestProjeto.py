import os
import mysql.connector
from matplotlib import pyplot as plt
from PyPDF2 import PdfFileMerger

pdfs = ['Capital.pdf', 'Empreendedor.pdf', 'Mercado.pdf', 'Solucao.pdf', 'Tecnologia.pdf', 'Gestao.pdf']

mydb = mysql.connector.connect(
  host="cschool2021-bdo.ckpinnnxtfsw.us-east-1.rds.amazonaws.com",
  database= "salus",
  user="admin",
  password="ABCD1234"
)

mycursor = mydb.cursor()

mycursor.execute("SELECT Nome\
                  FROM Startup")

nomes = mycursor.fetchall()

for nome in nomes:
  print(nome[0])

nome = input("\nDigite o nome da Startup: ")

mycursor.execute("SELECT *\
                  FROM Mercado \
                  INNER JOIN Startup \
                  ON Mercado.Codigo = Startup.Codigo"
                 )
myresult = mycursor.fetchall()

for x in myresult:
  if (nome == x[6]):
    fig, ax1 = plt.subplots(1, figsize=(10,5))
    ax1.bar(['Maturidade Comercial','Complexidade de Mercado', 'Validação de Problema'],[x[1], x[2], x[3]],color='#587C3D')
    ax1.set(title=x[6] + ' - ' + 'Mercado', xlabel="Indicadores", ylabel="Valor")
    plt.ylim(0, 5)
    plt.savefig('Mercado.pdf', dpi=300, bbox_inches='tight')

mycursor.execute("SELECT *\
                  FROM Empreendedor \
                  INNER JOIN Startup \
                  ON Empreendedor.Codigo = Startup.Codigo"
                 )
myresult = mycursor.fetchall()

for x in myresult:
  if (nome == x[6]):
    fig, ax1 = plt.subplots(1, figsize=(10,5))
    ax1.bar(['Relacionamento com o time', 'Qualificação'],[x[2], x[3]],color='#587C3D')
    ax1.set(title=x[6] + ' - ' + 'Empreendedor', xlabel="Indicadores", ylabel="Valor")
    plt.ylim(0, 5)
    plt.savefig('Empreendedor.pdf', dpi=300, bbox_inches='tight')

mycursor.execute("SELECT *\
                  FROM Solucao \
                  INNER JOIN Startup \
                  ON Solucao.Codigo = Startup.Codigo"
                 )

myresult = mycursor.fetchall()

for x in myresult:
  if (nome == x[6]):
    fig, ax1 = plt.subplots(1, figsize=(10,5))
    ax1.bar(['Capacidade de desenvolvimento','Capacidade de escala'],[x[1], x[2]],color='#587C3D')
    ax1.set(title=x[6] + ' - ' + 'Solucao', xlabel="Indicadores", ylabel="Valor")
    plt.ylim(0, 5)
    plt.savefig('Solucao.pdf', dpi=300, bbox_inches='tight')

mycursor.execute("SELECT *\
                  FROM Gestao \
                  INNER JOIN Startup \
                  ON Gestao.Codigo = Startup.Codigo"
                 )
myresult = mycursor.fetchall()

for x in myresult:
  if (nome == x[6]):
    fig, ax1 = plt.subplots(1, figsize=(10,5))
    ax1.bar(['Regularidade fiscal e juridica', 'Projeção de crescimento', 'Processos e fluxos internos'],[x[1], x[2], x[3]],color='#587C3D')
    ax1.set(title=x[6] + ' - ' + 'Gestao', xlabel="Indicadores", ylabel="Valor")
    plt.ylim(0, 5)
    plt.savefig('Gestao.pdf', dpi=300, bbox_inches='tight')

mycursor.execute("SELECT *\
                  FROM Tecnologia \
                  INNER JOIN Startup \
                  ON Tecnologia.Codigo = Startup.Codigo"
                 )
myresult = mycursor.fetchall()

for x in myresult:
  if (nome == x[7]):
    fig, ax1 = plt.subplots(1, figsize=(10,5))
    ax1.bar(['Diferencial de mercado', 'Inovação tecnológica', 'Usabilidade'],[x[2], x[3], x[4]],color='#587C3D')
    ax1.set(title=x[7] + ' - ' + 'Tecnologia', xlabel="Indicadores", ylabel="Valor")
    plt.ylim(0, 5)
    plt.savefig('Tecnologia.pdf', dpi=300, bbox_inches='tight')

mycursor.execute("SELECT *\
                FROM Capital \
                INNER JOIN Startup \
                ON Capital.Codigo = Startup.Codigo"
                )

myresult = mycursor.fetchall()

for x in myresult:
  if (nome == x[9]):
    fig, ax1 = plt.subplots(1, figsize=(10,5))
    ax1.bar(['Capital investido','Acesso à mercado internacional', 'Fatia de mercado alcançada'],[x[2], x[5], x[6]],color='#587C3D')
    ax1.set(title=x[9] + ' - ' + 'Capital', xlabel="Indicadores", ylabel="Valor")
    plt.ylim(0, 5)
    plt.savefig('Capital.pdf', dpi=300, bbox_inches='tight')
    plt.savefig("test.png")


merger = PdfFileMerger()

for pdf in pdfs:
    merger.append(pdf)

merger.write("relatório.pdf")
merger.close()

for pdf in pdfs:
  os.remove(pdf)
