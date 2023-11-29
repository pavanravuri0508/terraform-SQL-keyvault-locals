variable "rgname" {
    type        = string 
    description = "resource group name"
}
variable "location" {
    type        = string 
    description = "Azure Region"
}    
variable "tags" {
    type        = map(string) 
    description = "tags related to project"
}
