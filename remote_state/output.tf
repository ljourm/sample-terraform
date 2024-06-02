output "remote_state" {
  value = {
    secret_manager = {
      id: data.terraform_remote_state.secret_manager.outputs.secret_manager.id
    }
  }
}
