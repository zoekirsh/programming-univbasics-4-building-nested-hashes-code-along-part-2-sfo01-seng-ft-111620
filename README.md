# Accessing Nested Hashes Code Along

## Learning Goals

- Access and manipulate data in nested hashes.

## Epic Tragedy Returned

We are going to continue with our previous example of Shakespearean works. This
time, we will spare you the literature lesson - the nested hashes of characters
are provided this time. Your task will be to access and modify those hashes.

## Instructions

## Manipulating A Hash

In previous lessons, we learned that you can access a value in a hash like
this:

```ruby
hash = {first: "first value!", second: "second value!"}

hash[:first]
#  => "first value!"
```

To access the values in a nested hash, we simply tack on additional keys,
until we have the last key that points to the value we want to access.

For example, if we had the following hash:

```rb
epic_tragedy = {
  :montague => {
      :patriarch => {name: "Lord Montague", age: "53"},
      :matriarch => {name: "Lady Montague", age: "54"},
      :hero => {name: "Romeo", age: "15", status: "alive"},
      :hero_friends => [
         {name: "Benvolio", age: "17", attitude: "worried"},
         {name: "Mercutio", age: "18", attitude: "hot-headed"}
      ]
   },
   :capulet => {
      :patriarch => {name: "Lord Capulet", age: "50"},
      :matriarch => {name: "Lady Capulet", age: "51"},
      :heroine => {name: "Juliet", age: "15", status: "alive"},
      :heroine_friends => [
        {name: "Steven", age: "30", attitude: "confused"},
        {name: "Nurse", age: "44", attitude: "worried"}
      ]
   }
}
```

To access the Montague patriarch's name, we use the hash name, `epic_tragedy`,
followed by a chained list of all of the key names that precede the value of his
name, enclosed in brackets:

```ruby
epic_tragedy[:montague][:patriarch][:name]
#  => "Lord Montague"
```

We can even use this method to change the value of a particular key. If we
wanted to reset the Montague patriarch's name to "Michael Jordan", we would do
it in the following way:

```ruby
epic_tragedy[:montague][:patriarch][:name] = "Michael Jordan"

puts epic_tragedy

#  =>
{
   :montague => {
      :patriarch => {name: "Michael Jordan", age: "53"},
      :matriarch => {name: "Lady Montague", age: "54"},
      :hero => {name: "Romeo", age: "15", status: "alive"},
      :hero_friends => [
        {name: "Benvolio", age: "17", attitude: "worried"},
        {name: "Mercutio", age: "18", attitude: "hot-headed"}
      ]
   },
   :capulet => {
      :patriarch => {name: "Lord Capulet", age: "50"},
      :matriarch => {name: "Lady Capulet", age: "51"},
      :heroine => {name: "Juliet", age: "15", status: "alive"},
      :heroine_friends => [
        {name: "Steven", age: "30", attitude: "confused"},
        {name: "Nurse", age: "44", attitude: "worried"}
      ]
   }
}
```

![Montague/Capulet Family Tree w/ Michael Jordan](https://curriculum-content.s3.amazonaws.com/programming-univbasics-4/nested-hashes/Image_8_NestedHash.png)

## Arrays in Hashes

In the `epic_tragedy` hash, both the `:montague` and `:capulet` nested hashes
contain arrays, `:hero_friends` and `heroine_friends`. Similar to how we chain
multiple keys in brackets to access nested hashes, we can also chain brackets
with integers for nested arrays. For instance, if we wanted to access the hash
containing Mercutio's information, we would need to access the second element in
the `:hero_friends` array:

```ruby
epic_tragedy[:montague][:hero_friends][1]
#  => {:name=>"Mercutio", :age=>"18", :attitude=>"hot-headed"}
```

And if we wanted to go further, we can continue to chain brackets:

```ruby
epic_tragedy[:montague][:hero_friends][1][:name]
#  => "Mercutio"
```

### Challenge

In `lib/updating_nested_hashes.rb`, your task is to finish two methods,
`update_status` and `add_characters`. In each, a hash is provided that need to
be modified. Rather than directly change the hash, try to write a programmatic
solution for modifying the hash content.

## `update_status`

For the `update_status` method,  you'll see an `epic_tragedy` hash is provided.
We've come to the end of the epic tragedy of Romeo and Juliet. At this point in
the story, Romeo and Juliet are — as in every good tragedy — quite dead.

Add code to the `update_status` method to change the status of our hero Romeo
and our heroine Juliet from "alive" to "dead".

## `fix_roles`

In the second method for this lab, `add_characters`, we are starting again with
an `epic_tragedy` hash. This time your task is to add some nested content into
the hash. We want to shout out some of the important characters from the play
that aren't a part of either family. Alongside `:montague` and `:capulet`, add a
third key to `epic_tragedy`, `:additional_characters`. This key should point to
an array.

Inside this array, add **two hashes**. Each hash should contain a single key,
`:name`. 

- For the first hash, assign `"Prince Escalus"` as the `:name`
- For the  second  hash, assign `"Apothecary"`

Run `learn` to track your progress and `learn submit` when you've finished your
work. A walkthrough is provided below, but try to first solve these as best you
can.

## Conclusion

Nested hashes can be very complex! However, their structure is very consistent.
Once data is contained within a hash, as long as we have the right keys, we can
access data from anywhere on the hash, no matter how deeply nested the data is.

Good night, good night! parting is such sweet sorrow, That I shall say good
night till it be morrow.

## Solving this Lab

### `update_status`

For `update_status`,  we're given the following array:

```rb
epic_tragedy = {
  :montague => {
      :patriarch => {name: "Lord Montague", age: "53"},
      :matriarch => {name: "Lady Montague", age: "54"},
      :hero => {name: "Romeo", age: "15", status: "alive"},
      :hero_friends => [
        {name: "Benvolio", age: "17", attitude: "worried"},
        {name: "Mercutio", age: "18", attitude: "hot-headed"}
      ]
  },
  :capulet => {
      :patriarch => {name: "Lord Capulet", age: "50"},
      :matriarch => {name: "Lady Capulet", age: "51"},
      :heroine => {name: "Juliet", age: "15", status: "alive"},
      :heroine_friends => [
      {name: "Steven", age: "30", attitude: "confused"},
      {name: "Nurse", age: "44", attitude: "worried"}
      ]
  }
}
```

We  need to change the `:status` of Romeo and Juliet to `"dead"`. The first step
would be to find a way to _access_ status.  We can read the hash above and see
what needs to change (and change it directly), but the task is to think of a
programmatic solution.

For Romeo, we see that the `epic_tragedy` hash contains a `:montague` key
pointing to a nested hash. We can start by accessing this nested hash:

```rb
epic_tragedy[:montague]
 # => {
 #      :patriarch => {name: "Lord Montague", age: "53"},
 #      :matriarch => {name: "Lady Montague", age: "54"},
 #      :hero => {name: "Romeo", age: "15", status: "alive"},
 #      :hero_friends => [
 #        {name: "Benvolio", age: "17", attitude: "worried"},
 #        {name: "Mercutio", age: "18", attitude: "hot-headed"}
 #      ]
 #    }
```

This hash contains a `:hero` key, which points to
another hash. We can chain brackets and add this key to previous code:

```rb
epic_tragedy[:montague][:hero]
 # => {name: "Romeo", age: "15", status: "alive"}
```

It is in _this_ hash that the `:status` key is present. We'll chain another
bracket, this time for `:status`:

```rb
epic_tragedy[:montague][:hero][:status]
 # => "alive"
```

Now that we can access `:status`, we can modify it by assigning it a different
value, in our case, `"dead"`.

```rb
epic_tragedy[:montague][:hero][:status] = "dead"
 # => "dead"
```

For Juliet, we follow the same process using the `:capulet` and `:heroine` keys
instead.

### `add_characters`

For the second method, we are again given an `epic_tragedy` hash (don't worry
that Romeo and Juliet are still alive, we're not testing for that). This time,
we need to add an `:additional_characters` key to the hash. This key should
point to an array of two hashes, each with a `:name` key. The first name will be
`"Prince Escalus"`, and the second will be `"Apothecary"`.

Similar to changing a value in a hash, we can add a key/value pair by providing
both the key we want to add and the value it should point to. If the key doesn't
exist, it will be created.

We can first add the key and assign it to an empty array:

```rb
epic_tragedy[:additional_characters] = []
 # => []
```

The next step would be to add the two hashes. We might do this with variables:

```rb
prince = { name: "Prince Escalus" }
apothecary = { name: "Apothecary" }
```

And then push these into the array:

```rb
epic_tragedy[:additional_characters] << prince
epic_tragedy[:additional_characters] << apothecary
```

But we can skip over the variables entirely and go straight to pushing the
hashes when they're created:

```rb
epic_tragedy[:additional_characters] << { name: "Prince Escalus" }
epic_tragedy[:additional_characters] << { name: "Apothecary" }
```

Or we could assign these hashes using chained brackets:

```rb
epic_tragedy[:additional_characters][0] = { name: "Prince Escalus" }
epic_tragedy[:additional_characters][1] = { name: "Apothecary" }
```

Any of these options will work. It is also perfectly valid to compose the
creation of both hashes when creating the array they are in:

```rb
epic_tragedy[:additional_characters] = [
  { name: "Prince Escalus" },
  { name: "Apothecary" }
]
 # => [{:name=>"Prince Escalus"}, {:name=>"Apothecary"}]
```

The expression above will handle everything needed for the `add_characters`
method.
