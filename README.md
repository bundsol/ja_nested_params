# JaNestedParams

Parser for nested params from Json Api document with `included` object.

## Motivation

When the Json Api describes a `compound document`, it does so in the scenario of
data being fetched from the server. When it talks about client side data sent
to the back end, it expects a single resource object, without the `included` 
array.
As it is the case in Elixir applications, you may send a composite object 
to the server that can delete related objects, update member entities and create
new objects in a single swoop. Ecto's changeset will accept a `map` of any 
complexity.
This packages takes the liberty of using the Json Api format to accept compound
documents coming from the front end. It leverages the `meta` object to try to 
provide `full linkage` among resources. It breaks the specification requirement
that a `resource identifier object` MUST contain an `id` member. When new 
resources don't have an `id`, a member of the `meta` object will play that
temporary role, namely `new-resource-tag`, which identifies a particular
`new resource` among all new resources of the same `type`. 
Although, quoting the spec, 
> The id member is not required when the resource object originates at the client 
and represents a new resource to be created on the server

Actually, the spec is talking only about a single primary data object.

## Notes
The argument to the only function in this package is an Elixir map. The function
is intended to replace the function `to_attributes` found in the 
`JaSerializer.Params` module of the `ja_serializer` package.


