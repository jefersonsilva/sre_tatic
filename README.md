# DevOps Challenge

## Descrição.

Projeto para uma calculadora online.

### Instruções de uso.

Certifique-se que tenha o terraform instalado em seu ambiente.

1. Configure o arquivo terraform/s3_module/variables.tf.
   1. bucket_name = Nome do buckete desejado
   2. tag_name = Tag para identificação de nome no painel aws.
   3. tag_env = Tag para identificação de ambiente no painel aws.
   4. deafault_route_53_zone = Id dazona onde o domínio está configurado dentro da aws
   5. deafault_domain = "dominio onde vai ser hospedado a caluladora
2. configure a reagião e o profile aws dentro do arquivo terraform/provider.tf
3. Depois rode o comando  `terraform init` dentro da pasta terraform
4. Depois rode o comando  `terraform plan` dentro da pasta terraform
5. Depois rode o comando  `terraform apply` dentro da pasta terraform
6. Depois rode o comando  `./deploy.sh`


Os passos acima, assumem que vc já tenha uma conta na aws e um profile do aws cli configurado em sua máquina.

## Url do projeto.

http://calc.jefersonsilva.in
