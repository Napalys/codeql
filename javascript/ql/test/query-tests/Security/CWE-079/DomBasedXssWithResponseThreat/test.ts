import { QueryClient, injectQuery } from '@tanstack/angular-query-experimental'

class ServiceOrComponent {
    query = injectQuery(() => ({
      queryKey: ['repoData'],
      queryFn: () =>
        this.#http.get<Response>('https://api.github.com/repos/tanstack/query'),
    }))

    #http: {
      get: <T>(url: string) => Promise<T>
    };

    constructor(http: any) {
      this.#http = http;
    }
    
    displayRepoDetails() {
      this.query.data.then(response => {
        // Vulnerability: Directly inserting API response data into the DOM
        document.getElementById('repoInfo').innerHTML = response.description;
        
        // Another vulnerable insertion point
        const detailsElement = document.createElement('div');
        detailsElement.innerHTML = `<h2>${response.name}</h2>
                                   <p>${response.owner.bio}</p>`;
        document.body.appendChild(detailsElement);
      });
    }

    renderStars() {
      // Another XSS vulnerability using document.write
      this.query.data.then(response => {
        const starContent = `<div class="stars">${response.stargazers_count} ★ - ${response.description}</div>`;
        document.write(starContent);
      });
    }
}

interface Response {
  name: string;
  description: string;
  stargazers_count: number;
  owner: {
    bio: string;
  }
}
