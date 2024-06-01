# WordPress EC2 RDS Docker

This project aims to deploy a WordPress website using Amazon EC2, Amazon RDS, and Docker.

## Prerequisites

Before getting started, make sure you have the following:

- An AWS account
- Terraform installed
- Basic knowledge of AWS services and Docker

## Getting Started

To deploy the WordPress website, follow these steps:

1. Clone this repository to your local machine.
2. Configure your AWS credentials using the AWS CLI or environment variables.
3. Initialize, plan and apply terraform.
4. Connect via SSH. 
5. Create and build the Docker image for the WordPress application in the EC2 instance.
6. Run the Docker container on an Amazon EC2 instance.
6. Access the WordPress website using the EC2 instance's public IP.

## Configuration

In order to customize your WordPress installation, you can modify the following files:

Update variables and create the file terraform.tfvars with the credentials.



## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
