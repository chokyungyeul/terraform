# # output "StgActName" {
# #   value = module.StorageAccount.stg_act_name_out
# # }

output "RgName" {
  value = module.ResourceGroup[*].rg_name_out
}

#output "vm_id" {
#  value       = module.vm01[*].vm_id_out
#  description = "The ID of the new VM"
#}

