package main

import (
    "fmt"
    "os"
    "net/http"
)

func hostnameHandler(w http.ResponseWriter, r *http.Request) {
    myhostname, _ := os.Hostname()
    fmt.Fprintln(w, "Hello world! I'm running on:", myhostname)
}

func main() {
    const port string = "8080"
    fmt.Println("Server listening on port", port)
    http.HandleFunc("/", hostnameHandler)
    http.ListenAndServe(":" + port, nil)
}
