package main

import (
	"net/http"
	"os"
)

func main() {
	msg := "Hello World"
	if len(os.Args) > 1 {
		msg = os.Args[1]
	}
	http.HandleFunc("/", func(w http.ResponseWriter, req *http.Request) {
		w.Write([]byte(msg))
	})
	http.ListenAndServe(":8080", nil)
}
