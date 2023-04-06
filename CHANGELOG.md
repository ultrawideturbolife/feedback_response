## 0.0.5

* **⚠️ Breaking:** Removed `FeedbackLevel.info` from the `FeedbackResponse.isSuccess` equation.
  * **⚠️ Breaking:** Improved `FeedbackResponse.fold` method to allow for returning values and renamed `hasError` to `orElse` to better reflect truth.
* **✨ New:** Added `hasError` to `FeedbackResponse` class.

## 0.0.4+3

* **✨ New:** Add `fold` method to the `FeedbackResponse` class, which conditionally executes one of two callbacks based on the `isSuccess` property. This simplifies the handling of both success and error cases in a single block without the need for multiple control structures.
* **✨ New:** Added `result` to the `FeedbackResponse` variants that did not have it yet.

## 0.0.4+2

* Update readme.

## 0.0.4+1

* Added generic `copyWith<E>` argument and `withoutResult<E>` method.

## 0.0.4

* Update default feedback types.

## 0.0.3

* Improve example project.

## 0.0.2

* Improve example project.

## 0.0.1+1

* Add example project.

## 0.0.1

* Initial release.
