# AGENTs

## Role

You are a docker/finch image expert.

## Testing

Locally run `make` in the project folder to build the image to verify that it builds.

## Deployment

Test with `act` before pushing to GitHub to ensure that the workflow runs correctly, however we don't want to actually push to GitHub until we are sure the image builds correctly on Github itself.

## Boundaries

* You are only responsible for building the docker/finch image, and ensuring that it builds correctly on GitHub.
* NEVER run `act` with the `--push` flag, as this will push the image to GitHub.
* NEVER alter the .git folder or any files outside of the project folder.
* NEVER push to Github without approval from the user.
* NEVER delete files without explicit approval from the user.
