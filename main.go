package main

import (
	"fmt"
	"log"
	"net/http"
	"text/template"
)

func main() {

	fmt.Println("Starting server on port 8080")

	http.HandleFunc("/", handler)

	log.Fatal(http.ListenAndServe(":8080", nil))

}

func handler(w http.ResponseWriter, r *http.Request) {
	tmpl := template.Must(template.ParseFiles("templates/index.html"))

	tmpl.Execute(w, nil)
}
