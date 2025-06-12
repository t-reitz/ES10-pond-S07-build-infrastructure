# ES10-pond-S07-build-infrastructure

Este repositório demonstra um **IaC** (Infrastructure as Code) básico com **Terraform** na AWS.  
A ideia é criar, de forma automatizada, uma VPC, subnet, security group e uma instância EC2.

---

## 📖 Referências

- Tutorial HashiCorp: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/infrastructure-as-code  
- Vídeo introdutório: https://www.youtube.com/watch?v=0EAjJe8aPkc  
- IBM Terraform (PT-BR): https://www.ibm.com/br-pt/topics/terraform  

---

## 🚀 Pré-requisitos

1. **Conta AWS** com credenciais configuradas (`~/.aws/credentials` ou variáveis de ambiente).  
2. Versão do Terraform instalada (>= 1.0).  
3. AWS CLI (opcional, para validar recursos após o apply).

---

## 🔧 Passo a passo

1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/terraform-iac-demo.git
   cd terraform-iac-demo
