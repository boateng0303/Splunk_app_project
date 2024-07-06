resource "aws_instance" "server1" {
  ami           = "ami-0195204d5dce06d99"
  instance_type = "t2.small"
  subnet_id     = aws_subnet.public1.id
  #security_groups = [aws_security_group.sg-demo.id]
  vpc_security_group_ids = [aws_security_group.sg-demo.id]
  key_name               = aws_key_pair.aws_key.key_name
  root_block_device {
    volume_size = 25
  }
  user_data = file("server.sh")
  tags = {
    Name = "splunk-inst"
  }

  depends_on = [aws_vpc.vp1]
}




