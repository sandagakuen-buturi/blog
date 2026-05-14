# frozen_string_literal: true

module ApiApplicationHelper
  class Response
    def self.success(message: "", data: {})
      {
        error: false,
        message: message,
        data: data
      }
    end

    def self.error(message: "", data: {})
      {
        error: true,
        message: message,
        data: data
      }
    end

    def self.validation_error(message: "Validation Error", data: {})
      {
        error: true,
        message: message,
        data: data
      }
    end

    def self.unauthorized(message: "Unauthorized", data: {})
      {
        error: true,
        message: message,
        data: data
      }
    end

    def self.not_found(message: "Not Found", data: {})
      {
        error: true,
        message: message,
        data: data
      }
    end

    def self.internal_error(message: "Internal Server Error", data: {})
      {
        error: true,
        message: message,
        data: data
      }
    end

    def self.forbidden(message: "Forbidden", data: {})
      {
        error: true,
        message: message,
        data: data
      }
    end

    def self.conflict(message: "Conflict", data: {})
      {
        error: true,
        message: message,
        data: data
      }
    end

    def self.bad_request(message: "Bad Request", data: {})
      {
        error: true,
        message: message,
        data: data
      }
    end

    def self.unprocessable_entity(message: "Unprocessable Entity", data: {})
      {
        error: true,
        message: message,
        data: data
      }
    end

    def self.ok(message: "OK", data: {})
      {
        error: false,
        message: message,
        data: data
      }
    end

    def self.created(message: "Created", data: {})
      {
        error: false,
        message: message,
        data: data
      }
    end
  end
end
