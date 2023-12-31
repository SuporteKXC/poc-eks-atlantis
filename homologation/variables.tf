variable "region" {
  type = string
}

# Variables Configuration

variable "cluster-name" {
  type        = string
}

variable "availability-zones" {
  type        = list
}

variable "k8s-version" {
  type        = string
}

variable "kublet-extra-args" {
  default     = ""
  type        = string
  description = "Additional arguments to supply to the node kubelet process"
}

variable "public-kublet-extra-args" {
  default     = ""
  type        = string
  description = "Additional arguments to supply to the public node kubelet process"

}


variable "eks-cw-logging" {
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  type        = list
  description = "Enable EKS CWL for EKS components"
}

variable "node-instance-type" {
  type        = string
}

variable "root-block-size" {
  type        = string

}

variable "desired-capacity" {
  type        = string
}

variable "max-size" {
  type        = string
}

variable "min-size" {
  type        = string
}

variable "node-name" {
  type        = string
} 

###### VPC 




variable "cluster_endpoint_private_access" {
  type = bool
}

variable "cluster_endpoint_public_access" {
  type = bool
}