terraform { 
  cloud { 
    
    organization = "silverink" 

    workspaces { 
      name = "terra-meta" 
    } 
  } 
}