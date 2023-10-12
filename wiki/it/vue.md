# VUE.js

# Install

https://cli.vuejs.org/guide/installation.html

    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt update && sudo apt install yarn
    
    yarn global add @vue/cli
    export PATH="$(yarn global bin):$PATH"
    vue --version

# Create a project


    vue ui
    vue create my-project
    
    yarn add vue-router
    yarn add vuex
    
    yarn serve

# Add typescript

    vue add typescript
    
add `tsconfig.json`. Vue files:

    <script lang="ts">
    </script>
