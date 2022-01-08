package main

import (
	"fmt"
	"os/exec"
	"strings"
)

func cleanOutput(out string) string {
	return strings.ReplaceAll(out, "\n", "")
}

func gitCommand(command string) (string, error) {
	cmd := exec.Command("git", command)
	out, err := cmd.Output()
	return cleanOutput(string(out)), err
}

func syncFromRemote() (bool, error) {
	out, err := gitCommand("pull")
	if err != nil {
		return false, err
	}

	if out == "Already up to date." {
		return false, nil
	}
	return true, nil
}

func main() {
	syncResult, err := syncFromRemote()
	if err != nil {
		fmt.Println("Problem with sync", err)
		return
	}
	if !syncResult {
		fmt.Println("Nothing new from remote")
	}
}
