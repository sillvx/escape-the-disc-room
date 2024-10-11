## **Criação de um README abrangente para seu projeto Git**

**Excelente iniciativa\!** Um bom README é fundamental para qualquer projeto, pois orienta novos colaboradores e documenta o processo de desenvolvimento.

**Abaixo, apresento uma sugestão de README, combinando informações sobre Git, VS Code e GameMaker, adaptada ao seu projeto específico:**

-----

### **escape-the-disc-room**

**Bem-vindo ao projeto escape-the-disc-room\!**

Este repositório contém o código fonte do jogo "Escape the Disc Room", desenvolvido em GameMaker.

#### **1. Instalação do Git**

  * **Windows:**
      - Baixe o instalador oficial do Git para Windows em [https://git-scm.com/download/win](https://www.google.com/url?sa=E&source=gmail&q=https://git-scm.com/download/win).
      - Siga as instruções do instalador, aceitando as opções padrão na maioria dos casos.
  * **macOS:**
      - A maneira mais fácil é instalar o Git usando o Homebrew:
        ```bash
        brew install git
        ```
  * **Linux:**
      - A instalação varia de acordo com a distribuição. Consulte a documentação da sua distribuição para obter instruções específicas. Geralmente, você pode instalar o Git usando o gerenciador de pacotes da sua distribuição (por exemplo, `apt`, `yum`, `dnf`).

#### **2. Configuração do Git no VS Code**

  * **Instalação:**
      - O VS Code já possui integração com o Git. Não é necessário instalar extensões adicionais.
  * **Configuração:**
      - Abra o VS Code e inicie um novo terminal (Ctrl+\`) ou use o terminal integrado.
      - Clone o repositório:
        ```bash
        git clone https://github.com/zzprd/escape-the-disc-room.git
        ```
      - Abra a pasta do projeto no VS Code.
  * **Uso básico:**
      - A guia "Source Control" do VS Code (geralmente à esquerda) mostrará as alterações pendentes.
      - Use os botões para adicionar arquivos à área de staging, commitar as alterações e enviar para o repositório remoto.

#### **3. Logando no Git e Fazendo Alterações**

  * **Configuração inicial:**
      - Abra um terminal e configure seu nome e email:
        ```bash
        git config --global user.name "Seu Nome"
        git config --global user.email "seu.email@example.com"
        ```
  * **Criando uma branch:**
      - Para trabalhar em novas funcionalidades sem afetar a versão principal, crie uma nova branch:
        ```bash
        git checkout -b nova-funcionalidade
        ```
  * **Fazendo alterações:**
      - Edite os arquivos do projeto. O VS Code irá marcar as alterações automaticamente.
  * **Commitando as alterações:**
      - Adicione as alterações à área de staging:
        ```bash
        git add .
        ```
      - Faça um commit com uma mensagem descritiva:
        ```bash
        git commit -m "Descrição das alterações"
        ```
  * **Enviando as alterações para o GitHub:**
      - Verifique se você está na branch correta.
      - Envie as alterações para o repositório remoto:
        ```bash
        git push origin nova-funcionalidade
        ```
      - Substitua `nova-funcionalidade` pelo nome da sua branch.

#### **Configuração do Git no GameMaker**

**O GameMaker não possui integração nativa com o Git.** No entanto, você pode utilizar o Git através do terminal do sistema operacional para gerenciar seus projetos GameMaker.

  * **Criar um repositório Git dentro da sua pasta de projeto GameMaker.**
  * **Utilizar os comandos Git padrão** para adicionar, commitar e enviar suas alterações.

**Recomendações:**

  * **Utilize branches:** Crie branches para cada nova funcionalidade ou correção de bugs. Isso facilita a organização do seu código e permite trabalhar em diferentes aspectos do projeto simultaneamente.
  * **Faça commits frequentes:** Commits pequenos e descritivos ajudam a rastrear as mudanças e facilitam a reverter alterações se necessário.
  * **Utilize um editor de código:** O VS Code é uma excelente opção, mas você pode usar qualquer outro editor que suporte o Git.
  * **Explore as funcionalidades do Git:** O Git oferece muitas funcionalidades avançadas, como merge, rebase e stash. Explore a documentação oficial para aprender mais.

**Para mais informações sobre o Git, consulte:** [https://git-scm.com/](https://www.google.com/url?sa=E&source=gmail&q=https://git-scm.com/)

**Lembre-se de adaptar este README às necessidades específicas do seu projeto.**



Com este README, você terá uma base sólida para começar a trabalhar com o Git em seu projeto GameMaker.
