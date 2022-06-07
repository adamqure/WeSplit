# WeSplit

We split is a test application from Paul Hudson's book *Hacking With Swift*. For more details, see the [Hacking With Swift website](https://www.hackingwithswift.com).

## Features
In this project we’re going to be building a check-splitting app that you might use after eating at a restaurant – you enter the cost of your food, select how much of a tip you want to leave, and how many people you’re with, and it will tell you how much each person needs to pay.

## Extra Challenges
One of the best ways to learn is to write your own code as often as possible, so here are three ways you should try extending this app to make sure you fully understand what’s going on:
1. Add a header to the third section, saying “Amount per person” **(Included)**
2. Add another section showing the total amount for the check – i.e., the original amount plus **(Included)**
tip value, without dividing by the number of people.
3. Change the tip percentage picker to show a new screen rather than using a segmented **(Not included because I like the segmented view more)**
control, and give it a wider range of options – everything from 0% to 100%. Tip: use the range 0..<101 for your range rather than a fixed array.

And if you found those easy, here’s a tough one for you: rather than having to
type .currency(code: Locale.current.currencyCode ?? "USD") in two places, can you make a new property to store the currency formatter? You’ll need to give your property a specific return type in order to keep the rest of your code happy: FloatingPointFormatStyle<Double>.Currency.
You can find that for yourself using Xcode’s Quick Help window – open up the right-hand navigator, then select the Quick Help inspector, and finally click select the .currency code. You’ll see Xcode displays <Value> rather than <Double>, because this thing is able to display other kinds of floating-point numbers too, but here we need Double. **(Included)**
