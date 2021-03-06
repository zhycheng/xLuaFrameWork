// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: Student.proto

package proto;

public final class StudentOuterClass {
  private StudentOuterClass() {}
  public static void registerAllExtensions(
      com.google.protobuf.ExtensionRegistryLite registry) {
  }

  public static void registerAllExtensions(
      com.google.protobuf.ExtensionRegistry registry) {
    registerAllExtensions(
        (com.google.protobuf.ExtensionRegistryLite) registry);
  }
  public interface StudentOrBuilder extends
      // @@protoc_insertion_point(interface_extends:proto.Student)
      com.google.protobuf.MessageOrBuilder {

    /**
     * <code>string name = 1;</code>
     */
    java.lang.String getName();
    /**
     * <code>string name = 1;</code>
     */
    com.google.protobuf.ByteString
        getNameBytes();

    /**
     * <code>int32 age = 2;</code>
     */
    int getAge();

    /**
     * <code>int32 height = 3;</code>
     */
    int getHeight();

    /**
     * <code>.proto.Student.Area locate = 4;</code>
     */
    int getLocateValue();
    /**
     * <code>.proto.Student.Area locate = 4;</code>
     */
    proto.StudentOuterClass.Student.Area getLocate();

    /**
     * <code>string job = 5;</code>
     */
    java.lang.String getJob();
    /**
     * <code>string job = 5;</code>
     */
    com.google.protobuf.ByteString
        getJobBytes();

    /**
     * <code>repeated string hobby = 6;</code>
     */
    java.util.List<java.lang.String>
        getHobbyList();
    /**
     * <code>repeated string hobby = 6;</code>
     */
    int getHobbyCount();
    /**
     * <code>repeated string hobby = 6;</code>
     */
    java.lang.String getHobby(int index);
    /**
     * <code>repeated string hobby = 6;</code>
     */
    com.google.protobuf.ByteString
        getHobbyBytes(int index);
  }
  /**
   * Protobuf type {@code proto.Student}
   */
  public  static final class Student extends
      com.google.protobuf.GeneratedMessageV3 implements
      // @@protoc_insertion_point(message_implements:proto.Student)
      StudentOrBuilder {
  private static final long serialVersionUID = 0L;
    // Use Student.newBuilder() to construct.
    private Student(com.google.protobuf.GeneratedMessageV3.Builder<?> builder) {
      super(builder);
    }
    private Student() {
      name_ = "";
      age_ = 0;
      height_ = 0;
      locate_ = 0;
      job_ = "";
      hobby_ = com.google.protobuf.LazyStringArrayList.EMPTY;
    }

    @java.lang.Override
    public final com.google.protobuf.UnknownFieldSet
    getUnknownFields() {
      return this.unknownFields;
    }
    private Student(
        com.google.protobuf.CodedInputStream input,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws com.google.protobuf.InvalidProtocolBufferException {
      this();
      if (extensionRegistry == null) {
        throw new java.lang.NullPointerException();
      }
      int mutable_bitField0_ = 0;
      com.google.protobuf.UnknownFieldSet.Builder unknownFields =
          com.google.protobuf.UnknownFieldSet.newBuilder();
      try {
        boolean done = false;
        while (!done) {
          int tag = input.readTag();
          switch (tag) {
            case 0:
              done = true;
              break;
            default: {
              if (!parseUnknownFieldProto3(
                  input, unknownFields, extensionRegistry, tag)) {
                done = true;
              }
              break;
            }
            case 10: {
              java.lang.String s = input.readStringRequireUtf8();

              name_ = s;
              break;
            }
            case 16: {

              age_ = input.readInt32();
              break;
            }
            case 24: {

              height_ = input.readInt32();
              break;
            }
            case 32: {
              int rawValue = input.readEnum();

              locate_ = rawValue;
              break;
            }
            case 42: {
              java.lang.String s = input.readStringRequireUtf8();

              job_ = s;
              break;
            }
            case 50: {
              java.lang.String s = input.readStringRequireUtf8();
              if (!((mutable_bitField0_ & 0x00000020) == 0x00000020)) {
                hobby_ = new com.google.protobuf.LazyStringArrayList();
                mutable_bitField0_ |= 0x00000020;
              }
              hobby_.add(s);
              break;
            }
          }
        }
      } catch (com.google.protobuf.InvalidProtocolBufferException e) {
        throw e.setUnfinishedMessage(this);
      } catch (java.io.IOException e) {
        throw new com.google.protobuf.InvalidProtocolBufferException(
            e).setUnfinishedMessage(this);
      } finally {
        if (((mutable_bitField0_ & 0x00000020) == 0x00000020)) {
          hobby_ = hobby_.getUnmodifiableView();
        }
        this.unknownFields = unknownFields.build();
        makeExtensionsImmutable();
      }
    }
    public static final com.google.protobuf.Descriptors.Descriptor
        getDescriptor() {
      return proto.StudentOuterClass.internal_static_proto_Student_descriptor;
    }

    protected com.google.protobuf.GeneratedMessageV3.FieldAccessorTable
        internalGetFieldAccessorTable() {
      return proto.StudentOuterClass.internal_static_proto_Student_fieldAccessorTable
          .ensureFieldAccessorsInitialized(
              proto.StudentOuterClass.Student.class, proto.StudentOuterClass.Student.Builder.class);
    }

    /**
     * Protobuf enum {@code proto.Student.Area}
     */
    public enum Area
        implements com.google.protobuf.ProtocolMessageEnum {
      /**
       * <code>urban = 0;</code>
       */
      urban(0),
      /**
       * <code>rural = 1;</code>
       */
      rural(1),
      UNRECOGNIZED(-1),
      ;

      /**
       * <code>urban = 0;</code>
       */
      public static final int urban_VALUE = 0;
      /**
       * <code>rural = 1;</code>
       */
      public static final int rural_VALUE = 1;


      public final int getNumber() {
        if (this == UNRECOGNIZED) {
          throw new java.lang.IllegalArgumentException(
              "Can't get the number of an unknown enum value.");
        }
        return value;
      }

      /**
       * @deprecated Use {@link #forNumber(int)} instead.
       */
      @java.lang.Deprecated
      public static Area valueOf(int value) {
        return forNumber(value);
      }

      public static Area forNumber(int value) {
        switch (value) {
          case 0: return urban;
          case 1: return rural;
          default: return null;
        }
      }

      public static com.google.protobuf.Internal.EnumLiteMap<Area>
          internalGetValueMap() {
        return internalValueMap;
      }
      private static final com.google.protobuf.Internal.EnumLiteMap<
          Area> internalValueMap =
            new com.google.protobuf.Internal.EnumLiteMap<Area>() {
              public Area findValueByNumber(int number) {
                return Area.forNumber(number);
              }
            };

      public final com.google.protobuf.Descriptors.EnumValueDescriptor
          getValueDescriptor() {
        return getDescriptor().getValues().get(ordinal());
      }
      public final com.google.protobuf.Descriptors.EnumDescriptor
          getDescriptorForType() {
        return getDescriptor();
      }
      public static final com.google.protobuf.Descriptors.EnumDescriptor
          getDescriptor() {
        return proto.StudentOuterClass.Student.getDescriptor().getEnumTypes().get(0);
      }

      private static final Area[] VALUES = values();

      public static Area valueOf(
          com.google.protobuf.Descriptors.EnumValueDescriptor desc) {
        if (desc.getType() != getDescriptor()) {
          throw new java.lang.IllegalArgumentException(
            "EnumValueDescriptor is not for this type.");
        }
        if (desc.getIndex() == -1) {
          return UNRECOGNIZED;
        }
        return VALUES[desc.getIndex()];
      }

      private final int value;

      private Area(int value) {
        this.value = value;
      }

      // @@protoc_insertion_point(enum_scope:proto.Student.Area)
    }

    private int bitField0_;
    public static final int NAME_FIELD_NUMBER = 1;
    private volatile java.lang.Object name_;
    /**
     * <code>string name = 1;</code>
     */
    public java.lang.String getName() {
      java.lang.Object ref = name_;
      if (ref instanceof java.lang.String) {
        return (java.lang.String) ref;
      } else {
        com.google.protobuf.ByteString bs = 
            (com.google.protobuf.ByteString) ref;
        java.lang.String s = bs.toStringUtf8();
        name_ = s;
        return s;
      }
    }
    /**
     * <code>string name = 1;</code>
     */
    public com.google.protobuf.ByteString
        getNameBytes() {
      java.lang.Object ref = name_;
      if (ref instanceof java.lang.String) {
        com.google.protobuf.ByteString b = 
            com.google.protobuf.ByteString.copyFromUtf8(
                (java.lang.String) ref);
        name_ = b;
        return b;
      } else {
        return (com.google.protobuf.ByteString) ref;
      }
    }

    public static final int AGE_FIELD_NUMBER = 2;
    private int age_;
    /**
     * <code>int32 age = 2;</code>
     */
    public int getAge() {
      return age_;
    }

    public static final int HEIGHT_FIELD_NUMBER = 3;
    private int height_;
    /**
     * <code>int32 height = 3;</code>
     */
    public int getHeight() {
      return height_;
    }

    public static final int LOCATE_FIELD_NUMBER = 4;
    private int locate_;
    /**
     * <code>.proto.Student.Area locate = 4;</code>
     */
    public int getLocateValue() {
      return locate_;
    }
    /**
     * <code>.proto.Student.Area locate = 4;</code>
     */
    public proto.StudentOuterClass.Student.Area getLocate() {
      proto.StudentOuterClass.Student.Area result = proto.StudentOuterClass.Student.Area.valueOf(locate_);
      return result == null ? proto.StudentOuterClass.Student.Area.UNRECOGNIZED : result;
    }

    public static final int JOB_FIELD_NUMBER = 5;
    private volatile java.lang.Object job_;
    /**
     * <code>string job = 5;</code>
     */
    public java.lang.String getJob() {
      java.lang.Object ref = job_;
      if (ref instanceof java.lang.String) {
        return (java.lang.String) ref;
      } else {
        com.google.protobuf.ByteString bs = 
            (com.google.protobuf.ByteString) ref;
        java.lang.String s = bs.toStringUtf8();
        job_ = s;
        return s;
      }
    }
    /**
     * <code>string job = 5;</code>
     */
    public com.google.protobuf.ByteString
        getJobBytes() {
      java.lang.Object ref = job_;
      if (ref instanceof java.lang.String) {
        com.google.protobuf.ByteString b = 
            com.google.protobuf.ByteString.copyFromUtf8(
                (java.lang.String) ref);
        job_ = b;
        return b;
      } else {
        return (com.google.protobuf.ByteString) ref;
      }
    }

    public static final int HOBBY_FIELD_NUMBER = 6;
    private com.google.protobuf.LazyStringList hobby_;
    /**
     * <code>repeated string hobby = 6;</code>
     */
    public com.google.protobuf.ProtocolStringList
        getHobbyList() {
      return hobby_;
    }
    /**
     * <code>repeated string hobby = 6;</code>
     */
    public int getHobbyCount() {
      return hobby_.size();
    }
    /**
     * <code>repeated string hobby = 6;</code>
     */
    public java.lang.String getHobby(int index) {
      return hobby_.get(index);
    }
    /**
     * <code>repeated string hobby = 6;</code>
     */
    public com.google.protobuf.ByteString
        getHobbyBytes(int index) {
      return hobby_.getByteString(index);
    }

    private byte memoizedIsInitialized = -1;
    public final boolean isInitialized() {
      byte isInitialized = memoizedIsInitialized;
      if (isInitialized == 1) return true;
      if (isInitialized == 0) return false;

      memoizedIsInitialized = 1;
      return true;
    }

    public void writeTo(com.google.protobuf.CodedOutputStream output)
                        throws java.io.IOException {
      if (!getNameBytes().isEmpty()) {
        com.google.protobuf.GeneratedMessageV3.writeString(output, 1, name_);
      }
      if (age_ != 0) {
        output.writeInt32(2, age_);
      }
      if (height_ != 0) {
        output.writeInt32(3, height_);
      }
      if (locate_ != proto.StudentOuterClass.Student.Area.urban.getNumber()) {
        output.writeEnum(4, locate_);
      }
      if (!getJobBytes().isEmpty()) {
        com.google.protobuf.GeneratedMessageV3.writeString(output, 5, job_);
      }
      for (int i = 0; i < hobby_.size(); i++) {
        com.google.protobuf.GeneratedMessageV3.writeString(output, 6, hobby_.getRaw(i));
      }
      unknownFields.writeTo(output);
    }

    public int getSerializedSize() {
      int size = memoizedSize;
      if (size != -1) return size;

      size = 0;
      if (!getNameBytes().isEmpty()) {
        size += com.google.protobuf.GeneratedMessageV3.computeStringSize(1, name_);
      }
      if (age_ != 0) {
        size += com.google.protobuf.CodedOutputStream
          .computeInt32Size(2, age_);
      }
      if (height_ != 0) {
        size += com.google.protobuf.CodedOutputStream
          .computeInt32Size(3, height_);
      }
      if (locate_ != proto.StudentOuterClass.Student.Area.urban.getNumber()) {
        size += com.google.protobuf.CodedOutputStream
          .computeEnumSize(4, locate_);
      }
      if (!getJobBytes().isEmpty()) {
        size += com.google.protobuf.GeneratedMessageV3.computeStringSize(5, job_);
      }
      {
        int dataSize = 0;
        for (int i = 0; i < hobby_.size(); i++) {
          dataSize += computeStringSizeNoTag(hobby_.getRaw(i));
        }
        size += dataSize;
        size += 1 * getHobbyList().size();
      }
      size += unknownFields.getSerializedSize();
      memoizedSize = size;
      return size;
    }

    @java.lang.Override
    public boolean equals(final java.lang.Object obj) {
      if (obj == this) {
       return true;
      }
      if (!(obj instanceof proto.StudentOuterClass.Student)) {
        return super.equals(obj);
      }
      proto.StudentOuterClass.Student other = (proto.StudentOuterClass.Student) obj;

      boolean result = true;
      result = result && getName()
          .equals(other.getName());
      result = result && (getAge()
          == other.getAge());
      result = result && (getHeight()
          == other.getHeight());
      result = result && locate_ == other.locate_;
      result = result && getJob()
          .equals(other.getJob());
      result = result && getHobbyList()
          .equals(other.getHobbyList());
      result = result && unknownFields.equals(other.unknownFields);
      return result;
    }

    @java.lang.Override
    public int hashCode() {
      if (memoizedHashCode != 0) {
        return memoizedHashCode;
      }
      int hash = 41;
      hash = (19 * hash) + getDescriptor().hashCode();
      hash = (37 * hash) + NAME_FIELD_NUMBER;
      hash = (53 * hash) + getName().hashCode();
      hash = (37 * hash) + AGE_FIELD_NUMBER;
      hash = (53 * hash) + getAge();
      hash = (37 * hash) + HEIGHT_FIELD_NUMBER;
      hash = (53 * hash) + getHeight();
      hash = (37 * hash) + LOCATE_FIELD_NUMBER;
      hash = (53 * hash) + locate_;
      hash = (37 * hash) + JOB_FIELD_NUMBER;
      hash = (53 * hash) + getJob().hashCode();
      if (getHobbyCount() > 0) {
        hash = (37 * hash) + HOBBY_FIELD_NUMBER;
        hash = (53 * hash) + getHobbyList().hashCode();
      }
      hash = (29 * hash) + unknownFields.hashCode();
      memoizedHashCode = hash;
      return hash;
    }

    public static proto.StudentOuterClass.Student parseFrom(
        java.nio.ByteBuffer data)
        throws com.google.protobuf.InvalidProtocolBufferException {
      return PARSER.parseFrom(data);
    }
    public static proto.StudentOuterClass.Student parseFrom(
        java.nio.ByteBuffer data,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws com.google.protobuf.InvalidProtocolBufferException {
      return PARSER.parseFrom(data, extensionRegistry);
    }
    public static proto.StudentOuterClass.Student parseFrom(
        com.google.protobuf.ByteString data)
        throws com.google.protobuf.InvalidProtocolBufferException {
      return PARSER.parseFrom(data);
    }
    public static proto.StudentOuterClass.Student parseFrom(
        com.google.protobuf.ByteString data,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws com.google.protobuf.InvalidProtocolBufferException {
      return PARSER.parseFrom(data, extensionRegistry);
    }
    public static proto.StudentOuterClass.Student parseFrom(byte[] data)
        throws com.google.protobuf.InvalidProtocolBufferException {
      return PARSER.parseFrom(data);
    }
    public static proto.StudentOuterClass.Student parseFrom(
        byte[] data,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws com.google.protobuf.InvalidProtocolBufferException {
      return PARSER.parseFrom(data, extensionRegistry);
    }
    public static proto.StudentOuterClass.Student parseFrom(java.io.InputStream input)
        throws java.io.IOException {
      return com.google.protobuf.GeneratedMessageV3
          .parseWithIOException(PARSER, input);
    }
    public static proto.StudentOuterClass.Student parseFrom(
        java.io.InputStream input,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws java.io.IOException {
      return com.google.protobuf.GeneratedMessageV3
          .parseWithIOException(PARSER, input, extensionRegistry);
    }
    public static proto.StudentOuterClass.Student parseDelimitedFrom(java.io.InputStream input)
        throws java.io.IOException {
      return com.google.protobuf.GeneratedMessageV3
          .parseDelimitedWithIOException(PARSER, input);
    }
    public static proto.StudentOuterClass.Student parseDelimitedFrom(
        java.io.InputStream input,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws java.io.IOException {
      return com.google.protobuf.GeneratedMessageV3
          .parseDelimitedWithIOException(PARSER, input, extensionRegistry);
    }
    public static proto.StudentOuterClass.Student parseFrom(
        com.google.protobuf.CodedInputStream input)
        throws java.io.IOException {
      return com.google.protobuf.GeneratedMessageV3
          .parseWithIOException(PARSER, input);
    }
    public static proto.StudentOuterClass.Student parseFrom(
        com.google.protobuf.CodedInputStream input,
        com.google.protobuf.ExtensionRegistryLite extensionRegistry)
        throws java.io.IOException {
      return com.google.protobuf.GeneratedMessageV3
          .parseWithIOException(PARSER, input, extensionRegistry);
    }

    public Builder newBuilderForType() { return newBuilder(); }
    public static Builder newBuilder() {
      return DEFAULT_INSTANCE.toBuilder();
    }
    public static Builder newBuilder(proto.StudentOuterClass.Student prototype) {
      return DEFAULT_INSTANCE.toBuilder().mergeFrom(prototype);
    }
    public Builder toBuilder() {
      return this == DEFAULT_INSTANCE
          ? new Builder() : new Builder().mergeFrom(this);
    }

    @java.lang.Override
    protected Builder newBuilderForType(
        com.google.protobuf.GeneratedMessageV3.BuilderParent parent) {
      Builder builder = new Builder(parent);
      return builder;
    }
    /**
     * Protobuf type {@code proto.Student}
     */
    public static final class Builder extends
        com.google.protobuf.GeneratedMessageV3.Builder<Builder> implements
        // @@protoc_insertion_point(builder_implements:proto.Student)
        proto.StudentOuterClass.StudentOrBuilder {
      public static final com.google.protobuf.Descriptors.Descriptor
          getDescriptor() {
        return proto.StudentOuterClass.internal_static_proto_Student_descriptor;
      }

      protected com.google.protobuf.GeneratedMessageV3.FieldAccessorTable
          internalGetFieldAccessorTable() {
        return proto.StudentOuterClass.internal_static_proto_Student_fieldAccessorTable
            .ensureFieldAccessorsInitialized(
                proto.StudentOuterClass.Student.class, proto.StudentOuterClass.Student.Builder.class);
      }

      // Construct using proto.StudentOuterClass.Student.newBuilder()
      private Builder() {
        maybeForceBuilderInitialization();
      }

      private Builder(
          com.google.protobuf.GeneratedMessageV3.BuilderParent parent) {
        super(parent);
        maybeForceBuilderInitialization();
      }
      private void maybeForceBuilderInitialization() {
        if (com.google.protobuf.GeneratedMessageV3
                .alwaysUseFieldBuilders) {
        }
      }
      public Builder clear() {
        super.clear();
        name_ = "";

        age_ = 0;

        height_ = 0;

        locate_ = 0;

        job_ = "";

        hobby_ = com.google.protobuf.LazyStringArrayList.EMPTY;
        bitField0_ = (bitField0_ & ~0x00000020);
        return this;
      }

      public com.google.protobuf.Descriptors.Descriptor
          getDescriptorForType() {
        return proto.StudentOuterClass.internal_static_proto_Student_descriptor;
      }

      public proto.StudentOuterClass.Student getDefaultInstanceForType() {
        return proto.StudentOuterClass.Student.getDefaultInstance();
      }

      public proto.StudentOuterClass.Student build() {
        proto.StudentOuterClass.Student result = buildPartial();
        if (!result.isInitialized()) {
          throw newUninitializedMessageException(result);
        }
        return result;
      }

      public proto.StudentOuterClass.Student buildPartial() {
        proto.StudentOuterClass.Student result = new proto.StudentOuterClass.Student(this);
        int from_bitField0_ = bitField0_;
        int to_bitField0_ = 0;
        result.name_ = name_;
        result.age_ = age_;
        result.height_ = height_;
        result.locate_ = locate_;
        result.job_ = job_;
        if (((bitField0_ & 0x00000020) == 0x00000020)) {
          hobby_ = hobby_.getUnmodifiableView();
          bitField0_ = (bitField0_ & ~0x00000020);
        }
        result.hobby_ = hobby_;
        result.bitField0_ = to_bitField0_;
        onBuilt();
        return result;
      }

      public Builder clone() {
        return (Builder) super.clone();
      }
      public Builder setField(
          com.google.protobuf.Descriptors.FieldDescriptor field,
          java.lang.Object value) {
        return (Builder) super.setField(field, value);
      }
      public Builder clearField(
          com.google.protobuf.Descriptors.FieldDescriptor field) {
        return (Builder) super.clearField(field);
      }
      public Builder clearOneof(
          com.google.protobuf.Descriptors.OneofDescriptor oneof) {
        return (Builder) super.clearOneof(oneof);
      }
      public Builder setRepeatedField(
          com.google.protobuf.Descriptors.FieldDescriptor field,
          int index, java.lang.Object value) {
        return (Builder) super.setRepeatedField(field, index, value);
      }
      public Builder addRepeatedField(
          com.google.protobuf.Descriptors.FieldDescriptor field,
          java.lang.Object value) {
        return (Builder) super.addRepeatedField(field, value);
      }
      public Builder mergeFrom(com.google.protobuf.Message other) {
        if (other instanceof proto.StudentOuterClass.Student) {
          return mergeFrom((proto.StudentOuterClass.Student)other);
        } else {
          super.mergeFrom(other);
          return this;
        }
      }

      public Builder mergeFrom(proto.StudentOuterClass.Student other) {
        if (other == proto.StudentOuterClass.Student.getDefaultInstance()) return this;
        if (!other.getName().isEmpty()) {
          name_ = other.name_;
          onChanged();
        }
        if (other.getAge() != 0) {
          setAge(other.getAge());
        }
        if (other.getHeight() != 0) {
          setHeight(other.getHeight());
        }
        if (other.locate_ != 0) {
          setLocateValue(other.getLocateValue());
        }
        if (!other.getJob().isEmpty()) {
          job_ = other.job_;
          onChanged();
        }
        if (!other.hobby_.isEmpty()) {
          if (hobby_.isEmpty()) {
            hobby_ = other.hobby_;
            bitField0_ = (bitField0_ & ~0x00000020);
          } else {
            ensureHobbyIsMutable();
            hobby_.addAll(other.hobby_);
          }
          onChanged();
        }
        this.mergeUnknownFields(other.unknownFields);
        onChanged();
        return this;
      }

      public final boolean isInitialized() {
        return true;
      }

      public Builder mergeFrom(
          com.google.protobuf.CodedInputStream input,
          com.google.protobuf.ExtensionRegistryLite extensionRegistry)
          throws java.io.IOException {
        proto.StudentOuterClass.Student parsedMessage = null;
        try {
          parsedMessage = PARSER.parsePartialFrom(input, extensionRegistry);
        } catch (com.google.protobuf.InvalidProtocolBufferException e) {
          parsedMessage = (proto.StudentOuterClass.Student) e.getUnfinishedMessage();
          throw e.unwrapIOException();
        } finally {
          if (parsedMessage != null) {
            mergeFrom(parsedMessage);
          }
        }
        return this;
      }
      private int bitField0_;

      private java.lang.Object name_ = "";
      /**
       * <code>string name = 1;</code>
       */
      public java.lang.String getName() {
        java.lang.Object ref = name_;
        if (!(ref instanceof java.lang.String)) {
          com.google.protobuf.ByteString bs =
              (com.google.protobuf.ByteString) ref;
          java.lang.String s = bs.toStringUtf8();
          name_ = s;
          return s;
        } else {
          return (java.lang.String) ref;
        }
      }
      /**
       * <code>string name = 1;</code>
       */
      public com.google.protobuf.ByteString
          getNameBytes() {
        java.lang.Object ref = name_;
        if (ref instanceof String) {
          com.google.protobuf.ByteString b = 
              com.google.protobuf.ByteString.copyFromUtf8(
                  (java.lang.String) ref);
          name_ = b;
          return b;
        } else {
          return (com.google.protobuf.ByteString) ref;
        }
      }
      /**
       * <code>string name = 1;</code>
       */
      public Builder setName(
          java.lang.String value) {
        if (value == null) {
    throw new NullPointerException();
  }
  
        name_ = value;
        onChanged();
        return this;
      }
      /**
       * <code>string name = 1;</code>
       */
      public Builder clearName() {
        
        name_ = getDefaultInstance().getName();
        onChanged();
        return this;
      }
      /**
       * <code>string name = 1;</code>
       */
      public Builder setNameBytes(
          com.google.protobuf.ByteString value) {
        if (value == null) {
    throw new NullPointerException();
  }
  checkByteStringIsUtf8(value);
        
        name_ = value;
        onChanged();
        return this;
      }

      private int age_ ;
      /**
       * <code>int32 age = 2;</code>
       */
      public int getAge() {
        return age_;
      }
      /**
       * <code>int32 age = 2;</code>
       */
      public Builder setAge(int value) {
        
        age_ = value;
        onChanged();
        return this;
      }
      /**
       * <code>int32 age = 2;</code>
       */
      public Builder clearAge() {
        
        age_ = 0;
        onChanged();
        return this;
      }

      private int height_ ;
      /**
       * <code>int32 height = 3;</code>
       */
      public int getHeight() {
        return height_;
      }
      /**
       * <code>int32 height = 3;</code>
       */
      public Builder setHeight(int value) {
        
        height_ = value;
        onChanged();
        return this;
      }
      /**
       * <code>int32 height = 3;</code>
       */
      public Builder clearHeight() {
        
        height_ = 0;
        onChanged();
        return this;
      }

      private int locate_ = 0;
      /**
       * <code>.proto.Student.Area locate = 4;</code>
       */
      public int getLocateValue() {
        return locate_;
      }
      /**
       * <code>.proto.Student.Area locate = 4;</code>
       */
      public Builder setLocateValue(int value) {
        locate_ = value;
        onChanged();
        return this;
      }
      /**
       * <code>.proto.Student.Area locate = 4;</code>
       */
      public proto.StudentOuterClass.Student.Area getLocate() {
        proto.StudentOuterClass.Student.Area result = proto.StudentOuterClass.Student.Area.valueOf(locate_);
        return result == null ? proto.StudentOuterClass.Student.Area.UNRECOGNIZED : result;
      }
      /**
       * <code>.proto.Student.Area locate = 4;</code>
       */
      public Builder setLocate(proto.StudentOuterClass.Student.Area value) {
        if (value == null) {
          throw new NullPointerException();
        }
        
        locate_ = value.getNumber();
        onChanged();
        return this;
      }
      /**
       * <code>.proto.Student.Area locate = 4;</code>
       */
      public Builder clearLocate() {
        
        locate_ = 0;
        onChanged();
        return this;
      }

      private java.lang.Object job_ = "";
      /**
       * <code>string job = 5;</code>
       */
      public java.lang.String getJob() {
        java.lang.Object ref = job_;
        if (!(ref instanceof java.lang.String)) {
          com.google.protobuf.ByteString bs =
              (com.google.protobuf.ByteString) ref;
          java.lang.String s = bs.toStringUtf8();
          job_ = s;
          return s;
        } else {
          return (java.lang.String) ref;
        }
      }
      /**
       * <code>string job = 5;</code>
       */
      public com.google.protobuf.ByteString
          getJobBytes() {
        java.lang.Object ref = job_;
        if (ref instanceof String) {
          com.google.protobuf.ByteString b = 
              com.google.protobuf.ByteString.copyFromUtf8(
                  (java.lang.String) ref);
          job_ = b;
          return b;
        } else {
          return (com.google.protobuf.ByteString) ref;
        }
      }
      /**
       * <code>string job = 5;</code>
       */
      public Builder setJob(
          java.lang.String value) {
        if (value == null) {
    throw new NullPointerException();
  }
  
        job_ = value;
        onChanged();
        return this;
      }
      /**
       * <code>string job = 5;</code>
       */
      public Builder clearJob() {
        
        job_ = getDefaultInstance().getJob();
        onChanged();
        return this;
      }
      /**
       * <code>string job = 5;</code>
       */
      public Builder setJobBytes(
          com.google.protobuf.ByteString value) {
        if (value == null) {
    throw new NullPointerException();
  }
  checkByteStringIsUtf8(value);
        
        job_ = value;
        onChanged();
        return this;
      }

      private com.google.protobuf.LazyStringList hobby_ = com.google.protobuf.LazyStringArrayList.EMPTY;
      private void ensureHobbyIsMutable() {
        if (!((bitField0_ & 0x00000020) == 0x00000020)) {
          hobby_ = new com.google.protobuf.LazyStringArrayList(hobby_);
          bitField0_ |= 0x00000020;
         }
      }
      /**
       * <code>repeated string hobby = 6;</code>
       */
      public com.google.protobuf.ProtocolStringList
          getHobbyList() {
        return hobby_.getUnmodifiableView();
      }
      /**
       * <code>repeated string hobby = 6;</code>
       */
      public int getHobbyCount() {
        return hobby_.size();
      }
      /**
       * <code>repeated string hobby = 6;</code>
       */
      public java.lang.String getHobby(int index) {
        return hobby_.get(index);
      }
      /**
       * <code>repeated string hobby = 6;</code>
       */
      public com.google.protobuf.ByteString
          getHobbyBytes(int index) {
        return hobby_.getByteString(index);
      }
      /**
       * <code>repeated string hobby = 6;</code>
       */
      public Builder setHobby(
          int index, java.lang.String value) {
        if (value == null) {
    throw new NullPointerException();
  }
  ensureHobbyIsMutable();
        hobby_.set(index, value);
        onChanged();
        return this;
      }
      /**
       * <code>repeated string hobby = 6;</code>
       */
      public Builder addHobby(
          java.lang.String value) {
        if (value == null) {
    throw new NullPointerException();
  }
  ensureHobbyIsMutable();
        hobby_.add(value);
        onChanged();
        return this;
      }
      /**
       * <code>repeated string hobby = 6;</code>
       */
      public Builder addAllHobby(
          java.lang.Iterable<java.lang.String> values) {
        ensureHobbyIsMutable();
        com.google.protobuf.AbstractMessageLite.Builder.addAll(
            values, hobby_);
        onChanged();
        return this;
      }
      /**
       * <code>repeated string hobby = 6;</code>
       */
      public Builder clearHobby() {
        hobby_ = com.google.protobuf.LazyStringArrayList.EMPTY;
        bitField0_ = (bitField0_ & ~0x00000020);
        onChanged();
        return this;
      }
      /**
       * <code>repeated string hobby = 6;</code>
       */
      public Builder addHobbyBytes(
          com.google.protobuf.ByteString value) {
        if (value == null) {
    throw new NullPointerException();
  }
  checkByteStringIsUtf8(value);
        ensureHobbyIsMutable();
        hobby_.add(value);
        onChanged();
        return this;
      }
      public final Builder setUnknownFields(
          final com.google.protobuf.UnknownFieldSet unknownFields) {
        return super.setUnknownFieldsProto3(unknownFields);
      }

      public final Builder mergeUnknownFields(
          final com.google.protobuf.UnknownFieldSet unknownFields) {
        return super.mergeUnknownFields(unknownFields);
      }


      // @@protoc_insertion_point(builder_scope:proto.Student)
    }

    // @@protoc_insertion_point(class_scope:proto.Student)
    private static final proto.StudentOuterClass.Student DEFAULT_INSTANCE;
    static {
      DEFAULT_INSTANCE = new proto.StudentOuterClass.Student();
    }

    public static proto.StudentOuterClass.Student getDefaultInstance() {
      return DEFAULT_INSTANCE;
    }

    private static final com.google.protobuf.Parser<Student>
        PARSER = new com.google.protobuf.AbstractParser<Student>() {
      public Student parsePartialFrom(
          com.google.protobuf.CodedInputStream input,
          com.google.protobuf.ExtensionRegistryLite extensionRegistry)
          throws com.google.protobuf.InvalidProtocolBufferException {
        return new Student(input, extensionRegistry);
      }
    };

    public static com.google.protobuf.Parser<Student> parser() {
      return PARSER;
    }

    @java.lang.Override
    public com.google.protobuf.Parser<Student> getParserForType() {
      return PARSER;
    }

    public proto.StudentOuterClass.Student getDefaultInstanceForType() {
      return DEFAULT_INSTANCE;
    }

  }

  private static final com.google.protobuf.Descriptors.Descriptor
    internal_static_proto_Student_descriptor;
  private static final 
    com.google.protobuf.GeneratedMessageV3.FieldAccessorTable
      internal_static_proto_Student_fieldAccessorTable;

  public static com.google.protobuf.Descriptors.FileDescriptor
      getDescriptor() {
    return descriptor;
  }
  private static  com.google.protobuf.Descriptors.FileDescriptor
      descriptor;
  static {
    java.lang.String[] descriptorData = {
      "\n\rStudent.proto\022\005proto\"\223\001\n\007Student\022\014\n\004na" +
      "me\030\001 \001(\t\022\013\n\003age\030\002 \001(\005\022\016\n\006height\030\003 \001(\005\022#\n" +
      "\006locate\030\004 \001(\0162\023.proto.Student.Area\022\013\n\003jo" +
      "b\030\005 \001(\t\022\r\n\005hobby\030\006 \003(\t\"\034\n\004Area\022\t\n\005urban\020" +
      "\000\022\t\n\005rural\020\001b\006proto3"
    };
    com.google.protobuf.Descriptors.FileDescriptor.InternalDescriptorAssigner assigner =
        new com.google.protobuf.Descriptors.FileDescriptor.    InternalDescriptorAssigner() {
          public com.google.protobuf.ExtensionRegistry assignDescriptors(
              com.google.protobuf.Descriptors.FileDescriptor root) {
            descriptor = root;
            return null;
          }
        };
    com.google.protobuf.Descriptors.FileDescriptor
      .internalBuildGeneratedFileFrom(descriptorData,
        new com.google.protobuf.Descriptors.FileDescriptor[] {
        }, assigner);
    internal_static_proto_Student_descriptor =
      getDescriptor().getMessageTypes().get(0);
    internal_static_proto_Student_fieldAccessorTable = new
      com.google.protobuf.GeneratedMessageV3.FieldAccessorTable(
        internal_static_proto_Student_descriptor,
        new java.lang.String[] { "Name", "Age", "Height", "Locate", "Job", "Hobby", });
  }

  // @@protoc_insertion_point(outer_class_scope)
}
