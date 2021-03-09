# have-some-chocolate
This is the stuff I always have to look-up whenever I update my pacakges. One day I might actually remember it! It's doubtful, but who knows. 

## Build the package
`choco pack package.nuspec`

## Test the package you just built
`choco install PackageName -dv -s .`

## Push the package 
`choco apikey --key <my api> --source https://push.chocolatey.org/`  
`choco push package.nupkg --source https://push.chocolatey.org/`


## Links that are surprisingly difficult to find on the chocolatey website  
* [Create Packages](https://docs.chocolatey.org/en-us/create/create-packages)
* [Shiitake Profile](https://chocolatey.org/profiles/shiitake)
* [PowerShell Reference](https://docs.chocolatey.org/en-us/create/functions/)
