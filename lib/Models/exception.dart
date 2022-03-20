 class HttpException implements Exception {

     String message;

     HttpException({this.message});

     @override
      String toString() {
      return message;
    }

   }



   class HandleDeniedAccessError extends HttpException {
     
    HandleDeniedAccessError(String message) : super(message:message ?? '');

   }