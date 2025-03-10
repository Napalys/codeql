<script setup>
import { useQuery, VueQueryClientProvider, QueryClient } from "@tanstack/vue-query";

const queryClient = new QueryClient();

const fetchData = async () => {
  const response = await fetch("https://jsonplaceholder.typicode.com/posts/1"); // $ Source[js/xss]
  return response.json();
}; 

const { isPending, isError, isFetching, data, error } = useQuery({
  queryKey: ["post"],
  queryFn: fetchData,
});
</script>

<template>
  <VueQueryClientProvider :client="queryClient">
    <div v-html="data"></div> <!-- $ Alert[js/xss] -->
  </VueQueryClientProvider>
</template>
