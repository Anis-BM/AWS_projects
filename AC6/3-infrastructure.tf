module "tokyo_infrastructure" {
  source               = "./modules/infra"
  launch_template_id   = aws_launch_template.tokyo_launch_template.id
  asg_min_size         = 1
  asg_max_size         = 2
  asg_desired_capacity = 1
  vpc_id               = module.tokyo_network.vpc_id
  public_subnet_ids    = module.tokyo_network.public_subnet_ids
  private_subnet_ids   = module.tokyo_network.private_subnet_ids
  tags                 = { "Module" = "Infrastructure", "Region" = "Tokyo", Project = "IMMCstage1" , "Name" ="Tokyo"}
  providers            = { aws = aws.Tokyo }
}

module "new_york_infrastructure" {
  source               = "./modules/infra"
  launch_template_id   = aws_launch_template.New_York_launch_template.id
  asg_min_size         = 1
  asg_max_size         = 2
  asg_desired_capacity = 1
  vpc_id               = module.new_york_network.vpc_id
  public_subnet_ids    = module.new_york_network.public_subnet_ids
  private_subnet_ids   = module.new_york_network.private_subnet_ids
  tags                 = { "Module" = "Infrastructure", "Region" = "New York", Project = "IMMCstage1" , "Name" ="NewYork"}
  providers            = { aws = aws.New_York }
}

module "hong_kong_infrastructure" {
  source               = "./modules/infra"
  launch_template_id   = aws_launch_template.Hong_Kong_launch_template.id
  asg_min_size         = 1
  asg_max_size         = 2
  asg_desired_capacity = 1
  vpc_id               = module.Hong_Kong_network.vpc_id
  public_subnet_ids    = module.Hong_Kong_network.public_subnet_ids
  private_subnet_ids   = module.Hong_Kong_network.private_subnet_ids
  tags                 = { "Module" = "Infrastructure", "Region" = "Hong Kong", Project = "IMMCstage1" , "Name" ="Hong_Kong"}
  providers            = { aws = aws.Hong_Kong }
}

module "australia_infrastructure" {
  source               = "./modules/infra"
  launch_template_id   = aws_launch_template.Australia_launch_template.id
  asg_min_size         = 1
  asg_max_size         = 2
  asg_desired_capacity = 1
  vpc_id               = module.australia_network.vpc_id
  public_subnet_ids    = module.australia_network.public_subnet_ids
  private_subnet_ids   = module.australia_network.private_subnet_ids
  tags                 = { "Module" = "Infrastructure", "Region" = "Australia", Project = "IMMCstage1" , "Name" ="Australia"}
  providers            = { aws = aws.Australia}
}

module "london_infrastructure" {
  source               = "./modules/infra"
  launch_template_id   = aws_launch_template.London_launch_template.id
  asg_min_size         = 1
  asg_max_size         = 2
  asg_desired_capacity = 1
  vpc_id               = module.london_network.vpc_id
  public_subnet_ids    = module.london_network.public_subnet_ids
  private_subnet_ids   = module.london_network.private_subnet_ids
  tags                 = { "Module" = "Infrastructure", "Region" = "London", Project = "IMMCstage1" , "Name" ="London"}
  providers            = { aws = aws.London }
}

module "sao_paulo_infrastructure" {
  source               = "./modules/infra"
  launch_template_id   = aws_launch_template.Sao_Paulo_launch_template.id
  asg_min_size         = 1
  asg_max_size         = 2
  asg_desired_capacity = 1
  vpc_id               = module.sao_paulo_network.vpc_id
  public_subnet_ids    = module.sao_paulo_network.public_subnet_ids
  private_subnet_ids   = module.sao_paulo_network.private_subnet_ids
  tags                 = { "Module" = "Infrastructure", "Region" = "Sao Paulo", Project = "IMMCstage1" , "Name" ="Sao_Paulo"}
  providers            = { aws = aws.Sao_Paulo }
}

module "california_infrastructure" {
  source               = "./modules/infra"
  launch_template_id   = aws_launch_template.New_York_launch_template.id
  asg_min_size         = 1
  asg_max_size         = 2
  asg_desired_capacity = 1
  vpc_id               = module.california_network.vpc_id
  public_subnet_ids    = module.california_network.public_subnet_ids
  private_subnet_ids   = module.california_network.private_subnet_ids
  tags                 = { "Module" = "Infrastructure", "Region" = "California", Project = "IMMCstage1" , "Name" ="California"}
  providers            = { aws = aws.California }
}