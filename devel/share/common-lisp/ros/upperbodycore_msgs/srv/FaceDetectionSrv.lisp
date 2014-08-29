; Auto-generated. Do not edit!


(cl:in-package upperbodycore_msgs-srv)


;//! \htmlinclude FaceDetectionSrv-request.msg.html

(cl:defclass <FaceDetectionSrv-request> (roslisp-msg-protocol:ros-message)
  ((request_de
    :reader request_de
    :initarg :request_de
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass FaceDetectionSrv-request (<FaceDetectionSrv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FaceDetectionSrv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FaceDetectionSrv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<FaceDetectionSrv-request> is deprecated: use upperbodycore_msgs-srv:FaceDetectionSrv-request instead.")))

(cl:ensure-generic-function 'request_de-val :lambda-list '(m))
(cl:defmethod request_de-val ((m <FaceDetectionSrv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:request_de-val is deprecated.  Use upperbodycore_msgs-srv:request_de instead.")
  (request_de m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FaceDetectionSrv-request>) ostream)
  "Serializes a message object of type '<FaceDetectionSrv-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'request_de) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FaceDetectionSrv-request>) istream)
  "Deserializes a message object of type '<FaceDetectionSrv-request>"
    (cl:setf (cl:slot-value msg 'request_de) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FaceDetectionSrv-request>)))
  "Returns string type for a service object of type '<FaceDetectionSrv-request>"
  "upperbodycore_msgs/FaceDetectionSrvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FaceDetectionSrv-request)))
  "Returns string type for a service object of type 'FaceDetectionSrv-request"
  "upperbodycore_msgs/FaceDetectionSrvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FaceDetectionSrv-request>)))
  "Returns md5sum for a message object of type '<FaceDetectionSrv-request>"
  "b6e8035f5fefcd80d13e25e27ca322a3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FaceDetectionSrv-request)))
  "Returns md5sum for a message object of type 'FaceDetectionSrv-request"
  "b6e8035f5fefcd80d13e25e27ca322a3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FaceDetectionSrv-request>)))
  "Returns full string definition for message of type '<FaceDetectionSrv-request>"
  (cl:format cl:nil "bool request_de~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FaceDetectionSrv-request)))
  "Returns full string definition for message of type 'FaceDetectionSrv-request"
  (cl:format cl:nil "bool request_de~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FaceDetectionSrv-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FaceDetectionSrv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'FaceDetectionSrv-request
    (cl:cons ':request_de (request_de msg))
))
;//! \htmlinclude FaceDetectionSrv-response.msg.html

(cl:defclass <FaceDetectionSrv-response> (roslisp-msg-protocol:ros-message)
  ((resulet
    :reader resulet
    :initarg :resulet
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass FaceDetectionSrv-response (<FaceDetectionSrv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FaceDetectionSrv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FaceDetectionSrv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name upperbodycore_msgs-srv:<FaceDetectionSrv-response> is deprecated: use upperbodycore_msgs-srv:FaceDetectionSrv-response instead.")))

(cl:ensure-generic-function 'resulet-val :lambda-list '(m))
(cl:defmethod resulet-val ((m <FaceDetectionSrv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader upperbodycore_msgs-srv:resulet-val is deprecated.  Use upperbodycore_msgs-srv:resulet instead.")
  (resulet m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FaceDetectionSrv-response>) ostream)
  "Serializes a message object of type '<FaceDetectionSrv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'resulet) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FaceDetectionSrv-response>) istream)
  "Deserializes a message object of type '<FaceDetectionSrv-response>"
    (cl:setf (cl:slot-value msg 'resulet) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FaceDetectionSrv-response>)))
  "Returns string type for a service object of type '<FaceDetectionSrv-response>"
  "upperbodycore_msgs/FaceDetectionSrvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FaceDetectionSrv-response)))
  "Returns string type for a service object of type 'FaceDetectionSrv-response"
  "upperbodycore_msgs/FaceDetectionSrvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FaceDetectionSrv-response>)))
  "Returns md5sum for a message object of type '<FaceDetectionSrv-response>"
  "b6e8035f5fefcd80d13e25e27ca322a3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FaceDetectionSrv-response)))
  "Returns md5sum for a message object of type 'FaceDetectionSrv-response"
  "b6e8035f5fefcd80d13e25e27ca322a3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FaceDetectionSrv-response>)))
  "Returns full string definition for message of type '<FaceDetectionSrv-response>"
  (cl:format cl:nil "bool resulet~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FaceDetectionSrv-response)))
  "Returns full string definition for message of type 'FaceDetectionSrv-response"
  (cl:format cl:nil "bool resulet~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FaceDetectionSrv-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FaceDetectionSrv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'FaceDetectionSrv-response
    (cl:cons ':resulet (resulet msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'FaceDetectionSrv)))
  'FaceDetectionSrv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'FaceDetectionSrv)))
  'FaceDetectionSrv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FaceDetectionSrv)))
  "Returns string type for a service object of type '<FaceDetectionSrv>"
  "upperbodycore_msgs/FaceDetectionSrv")