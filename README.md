Example of JSON Parse issue while Blaze re-renders Each loop.
-------------------------------------------------------------

To see issue, open Google Developer Toolbar.

First Click on the Click Me of the 2nd list item and press Delete in the dialog ( You will notice List Item 2 displayed in dialog).

Then Click on List item 3, and you will see the context of List Item 2 is visible in the Dialog. The delete will not work because it can't match the ID of listiem 2 anymore in the Session list.

If you inspect the source of Listitem 3 Click Me element, you will see that the data-use-context holds JSON of the correct object. However, it is automatically parsed and but then the mixup takes place.

The only way of preventing the incorrect JSON to be parsed was by not using the `node.data('useContext')` call but a plain `node[0].getAttribute('data-use-context')` to get the attribute value and then Parse it myself in my the Dialog created call. This will always get me the correct Object of the Listitem.

However, using the `node.data('useContext')` should not give me the wrong object when executed as described above.
