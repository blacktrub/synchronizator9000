package main

import (
	"fmt"
	"os/exec"
	"strings"
)

func cleanOutput(out string) string {
	return strings.ReplaceAll(out, "\n", "")
}

func gitCommand(commands ...string) (string, error) {
	cmd := exec.Command("git", commands...)
	out, err := cmd.Output()
	return cleanOutput(string(out)), err
}

func commitChanges() (bool, error) {
	statusOut, err := gitCommand("status")
	if err != nil {
		return false, err
	}
	if strings.Contains(statusOut, "working tree clean") {
	    return false, nil
	}

    gitCommand("add", ".")
    gitCommand("commit", "-m", "'auto update config'")
    _, err = gitCommand("push")
	if err != nil {
		return false, err
	}
    return true, nil
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

	commitChangesResult, err := commitChanges()
	if err != nil {
		fmt.Println("Problem with commit changes", err)
		return
	}
	if !commitChangesResult {
		fmt.Println("Nothing to commit")
	}
}
