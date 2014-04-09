# CompleteSet Rails Repo

CompleteSet is the treasure map for collectors. It helps collectors to identify which collectibles they are missing and where they can obtain those collectibles.

# 4-04-2014

```
As a collector
I want to sign up for CompleteSet
Because I want a treasure map for my collection
```

```
As a collector
I want to login to CompleteSet
So I can use it again later
```

--------

Testing Steps

1. You can login at http://rumpj2-72842.use1.nitrousbox.com/login with the credentials test@completeset.com/testing
2. You can log out by selecting Logout from the gear menu in the top right corner
3. You can register at http://rumpj2-72842.use1.nitrousbox.com/users/new

# 4-18-2014

Viewing collectibles

```
As a collector
I wish to see all of the collectibles
So I know what I have and what I'm missing
```

```
As a collector
I want to be able to see all of the items made by a brand
So I can collect only certain brands
```

Haves/wants

```
As a collector
I want to mark which collectibles I have
So I can show off my collection to my friends
```

```
As a collector
I want to mark which collectibles I'm missing
So I know which collectibles I need to buy
```

------------

Testing Steps:

1. When you login, you are redirected to /users, which lists all users
2. You can get to lists of all items and all brands with the links at the top
3. You can click into a user entry to view their collection
4. You can click into a brand entry to view that brand's catalog
5. You can click into an item entry to view that item's profile, which gives more information about the item
6. Click the checkmark on an item entry to indicate that you have that item
7. Click the heart on an item entry to indicate that you're missing the item and want it
