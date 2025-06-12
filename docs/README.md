# ES10-pond-S07-build-infrastructure

**Infrastructure as Code (IaC)** com **Terraform** na AWS: demonstração prática de provisionamento de uma infraestrutura básica, incluindo VPC, Subnet, Security Group e instância EC2.

---

## Estrutura de Arquivos

Este repositório está organizado da seguinte forma:

| Arquivo       | Descrição                                                                 |
|---------------|---------------------------------------------------------------------------|
| provider.tf   | Configuração do Terraform e definição do provedor AWS (versão e região)   |
| variables.tf  | Declaração das variáveis de entrada utilizadas para parametrizar a infraestrutura |
| main.tf       | Criação dos recursos AWS: VPC, Subnet, Security Group e instância EC2      |
| outputs.tf    | Definição das saídas (outputs) do Terraform, incluindo o IP público da EC2 |
| docs/         | Imagens de apoio para ilustrar os comandos e resultados                     |

---

## Referências (Auto estudos)

- HashiCorp Tutorial: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/infrastructure-as-code  
- Vídeo introdutório: https://www.youtube.com/watch?v=0EAjJe8aPkc  
- IBM Terraform (PT-BR): https://www.ibm.com/br-pt/topics/terraform

---

## Pré-requisitos

Antes de iniciar, certifique-se de ter:

1. **Conta AWS** ativa com credenciais configuradas (`~/.aws/credentials` ou variáveis de ambiente).  
2. Terraform instalado (versão >= 1.0).  
3. AWS CLI instalado (opcional para validação adicional).

---

## ⚙️ Instalação do Terraform (macOS)

1. Atualize o repositório do Tap HashiCorp:  
```bash
brew tap hashicorp/tap
```
![brew tap hashicorp/tap](/docs/brew_tap_hashicorp-tap.png)

2. Instale o Terraform:  
```bash
brew install hashicorp/tap/terraform
```
![brew install hashicorp/tap/terraform](/docs/brew_install_hashicorp-tap-terraform.png)

3. Pronto, o Terraform está instalado na minha máquina.

## Passo a Passo de Provisionamento

### 1. Clone o repositório
```bash
git clone https://github.com/t-reitz/es10-pond-s07-build-infrastructure.git
cd es10-pond-s07-build-infrastructure
```

### 2. Inicialize o Terraform
O comando `terraform init` faz download dos plugins necessários e prepara o diretório de trabalho.
```bash
terraform init
```
![docs/terraform_init.png](/docs/terraform_init.png)

### 3. Planeje a execução
Com `terraform plan`, você visualiza em preview todos os recursos que serão criados, modificados ou destruídos.
```bash
terraform plan -out=tfplan
```
![docs/terraform_plan_1.png](/docs/terraform_plan_1.png)
![docs/terraform_plan_2.png](/docs/terraform_plan_2.png)
![docs/terraform_plan_3.png](/docs/terraform_plan_3.png)

### 4. Aplique o plano
Execute o plano gerado para provisionar a infraestrutura na AWS.
```bash
terraform apply "tfplan"
```
![docs/terraform_apply.png](/docs/terraform_apply.png)

### 5. Obtenha o IP público da EC2
Ao final do apply, utilize o comando `terraform output` para exibir o endereço IP público da instância criada.
```bash
terraform output instance_public_ip
```
![docs/terraform_public_ip.png](/docs/terraform_public_ip.png)

---

## Infraestrutura Provisionada

A seguir, um resumo dos recursos criados via Terraform:

| Recurso          | Nome/ID           | Descrição                             |
|------------------|-------------------|---------------------------------------|
| VPC              | demo-vpc          | Rede virtual com CIDR `10.0.0.0/16`   |
| Subnet           | demo-subnet       | Sub-rede pública `10.0.1.0/24`        |
| Security Group   | demo-sg           | Permite tráfego SSH (22) e HTTP (80) |
| EC2 Instance     | demo-instance     | Amazon Linux 2 (`t2.micro`)          |

As capturas de tela na pasta `docs/` comprovam o provisionamento dos recursos no Console AWS.

---

## Limpeza da Infraestrutura

Para remover todos os recursos criados e evitar cobranças futuras:
```bash
terraform destroy -auto-approve
```

![docs/terraform_destroy.png](/docs/terraform_destroy.png)