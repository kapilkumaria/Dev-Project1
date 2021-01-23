
resource "aws_instance" "web" {
  count                     = length(var.instance-web-tags)
  ami                       = lookup(var.ami, var.region)
  instance_type             = var.instance-type-web
  user_data                 = file(var.script)
  subnet_id                 = element(var.public-subnets, count.index)
  vpc_security_group_ids    = [var.sgforweb]
  key_name                  = var.key-name
    
  tags = {
    Name = element(var.instance-web-tags, count.index)
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("/home/ubuntu/kapilKP.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 60"
    ]
  }
  
  provisioner "file" {
    source                  = "index.js" 
    destination             = "/var/www/html/Dev-Project1/index.js"
        
  }
  
  provisioner "remote-exec" {
    inline = [
      "sleep 20"
    ]
  }

  provisioner "file" {
    source                  = "index.test.js" 
    destination             = "/var/www/html/Dev-Project1/index.test.js"
        
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 20"
    ]
  }

  
  provisioner "file" {
    source                  = "package.json" 
    destination             = "/var/www/html/Dev-Project1/package.json"
        
  }
    
  provisioner "remote-exec" {
    inline = [
      "sleep 20"
    ]
  }
  
  
  
  provisioner "file" {
    source                  = "000-default.conf" 
    destination             = "/etc/apache2/sites-available/000-default.conf"
       
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 20"
    ]
  }
  
  provisioner "file" {
    source                  = "dir.conf" 
    destination             = "/etc/apache2/mods-available/dir.conf"
       
  }
  }