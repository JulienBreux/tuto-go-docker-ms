package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
)

const github_api = "https://api.github.com/zen"

func main() {
	resp, err := http.Get(github_api)
	if err != nil {
		panic(err)
	}

	defer resp.Body.Close()
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		panic(err)
	}

	fmt.Printf("%s\n", body)
}
