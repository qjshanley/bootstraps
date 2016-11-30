#!/usr/bin/env ruby

require 'aws-sdk'

def main
  ec2 = Aws::EC2::Resource.new()

  vpc = ec2.create_vpc({ cidr_block: '11.0.0.0/16' })

  vpc.modify_attribute({
    enable_dns_support: { value: true }
  })

  vpc.modify_attribute({
    enable_dns_hostnames: { value: true }
  })

  vpc.create_tags({ tags: [{ key: 'Name', value: 'scale_test_vpc' }]})

  puts vpc.vpc_id



  subnet_dmz = ec2.create_subnet({
    vpc_id: vpc.vpc_id,
    cidr_block: '11.0.0.0/24',
    availability_zone: 'us-east-1a'
  })
  subnet_dmz.create_tags({ tags: [{ key: 'Name', value: 'scale_test_dmz_subnet' }]})
  puts subnet_dmz.id

  subnet_data_1a = ec2.create_subnet({
    vpc_id: vpc.vpc_id,
    cidr_block: '11.0.1.0/24',
    availability_zone: 'us-east-1a'
  })
  subnet_data_1a.create_tags({ tags: [{ key: 'Name', value: 'scale_test_data_subnet_us-east-1a' }]})
  puts subnet_data_1a.id

  subnet_data_1b = ec2.create_subnet({
    vpc_id: vpc.vpc_id,
    cidr_block: '11.0.2.0/24',
    availability_zone: 'us-east-1b'
  })
  subnet_data_1b.create_tags({ tags: [{ key: 'Name', value: 'scale_test_dmz_subnet_us-east-1b' }]})
  puts subnet_data_1b.id

  subnet_data_1d = ec2.create_subnet({
    vpc_id: vpc.vpc_id,
    cidr_block: '11.0.3.0/24',
    availability_zone: 'us-east-1d'
  })
  subnet_data_1d.create_tags({ tags: [{ key: 'Name', value: 'scale_test_dmz_subnet_us-east-1d' }]})
  puts subnet_data_1d.id


end

if __FILE__ == $0
	main
end
