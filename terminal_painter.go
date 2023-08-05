package main

import (
	// "fmt"
	// "bytes"
	"os"
	// "strings"
)

func main() {
	var d = os.Stdout
	var st = "sdas"
	// var t = byte(5)
	var f = []byte{43, 43, 43, 43, 43}
	d.Write(f)
	// println("")
	// println(val)

	// println("----------------------")

	var f2 = []byte{52, 53, 54, 55}
	// d.s
	d.WriteAt(f2, 0)
	d.WriteString(st)
	// println(err)
}
