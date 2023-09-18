TEMP_FILE="files"
PACKAGES_ROOT="packages/"
DATABASE="database"

package=$1

if [[ "$package" == "$DATABASE" ]]; then
  PACKAGES_DIR=''
fi

if [[ "$EVENT_NAME" == 'pull_request' ]]; then
  diffRes=$(git diff --name-only -r HEAD^1 HEAD | xargs)
else
  if [[ "$GITHUB_REF" == "$BRANCH_DEV" ]]; then
    diffRes=$(git diff --name-only $EVENT_BEFORE $EVENT_AFTER | xargs)
  else
    diffRes=$(git diff --name-only origin/dev $EVENT_AFTER | xargs)
  fi
fi

echo "$diffRes" >$TEMP_FILE

while IFS= read -r file; do
  checkRes=$(echo "$file" | grep "$PACKAGES_ROOT$package/")
  if [[ $checkRes ]]; then
    echo "Changed files found since $BRANCH_DEV:"
    echo "$checkRes"
    echo "::set-output name=delta::true"
    break
  fi
done <$TEMP_FILE
rm $TEMP_FILE
