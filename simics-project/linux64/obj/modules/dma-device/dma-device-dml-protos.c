
/* generated function prototypes */
static conf_class_t *_port_class_regs UNUSED;
static void  _DML_PIFACE_regs__bank_instrumentation_subscribe__disable_connection_callbacks(conf_object_t *_obj, conf_object_t *connection) UNUSED;
static void  _DML_PIFACE_regs__bank_instrumentation_subscribe__enable_connection_callbacks(conf_object_t *_obj, conf_object_t *connection) UNUSED;
static bank_callback_handle_t _DML_PIFACE_regs__bank_instrumentation_subscribe__register_after_read(conf_object_t *_obj, conf_object_t *connection, uint64 offset, uint64 size, after_read_callback_t after_read, void  *user_data) UNUSED;
static bank_callback_handle_t _DML_PIFACE_regs__bank_instrumentation_subscribe__register_after_write(conf_object_t *_obj, conf_object_t *connection, uint64 offset, uint64 size, after_write_callback_t after_write, void  *user_data) UNUSED;
static bank_callback_handle_t _DML_PIFACE_regs__bank_instrumentation_subscribe__register_before_read(conf_object_t *_obj, conf_object_t *connection, uint64 offset, uint64 size, before_read_callback_t before_read, void  *user_data) UNUSED;
static bank_callback_handle_t _DML_PIFACE_regs__bank_instrumentation_subscribe__register_before_write(conf_object_t *_obj, conf_object_t *connection, uint64 offset, uint64 size, before_write_callback_t before_write, void  *user_data) UNUSED;
static void  _DML_PIFACE_regs__bank_instrumentation_subscribe__remove_callback(conf_object_t *_obj, bank_callback_handle_t callback) UNUSED;
static void  _DML_PIFACE_regs__bank_instrumentation_subscribe__remove_connection_callbacks(conf_object_t *_obj, conf_object_t *connection) UNUSED;
static void  _DML_IFACE_regs__bank_instrumentation_subscribe__disable_connection_callbacks(conf_object_t *_obj, conf_object_t *connection) UNUSED;
static void  _DML_IFACE_regs__bank_instrumentation_subscribe__enable_connection_callbacks(conf_object_t *_obj, conf_object_t *connection) UNUSED;
static bank_callback_handle_t _DML_IFACE_regs__bank_instrumentation_subscribe__register_after_read(conf_object_t *_obj, conf_object_t *connection, uint64 offset, uint64 size, after_read_callback_t after_read, void  *user_data) UNUSED;
static bank_callback_handle_t _DML_IFACE_regs__bank_instrumentation_subscribe__register_after_write(conf_object_t *_obj, conf_object_t *connection, uint64 offset, uint64 size, after_write_callback_t after_write, void  *user_data) UNUSED;
static bank_callback_handle_t _DML_IFACE_regs__bank_instrumentation_subscribe__register_before_read(conf_object_t *_obj, conf_object_t *connection, uint64 offset, uint64 size, before_read_callback_t before_read, void  *user_data) UNUSED;
static bank_callback_handle_t _DML_IFACE_regs__bank_instrumentation_subscribe__register_before_write(conf_object_t *_obj, conf_object_t *connection, uint64 offset, uint64 size, before_write_callback_t before_write, void  *user_data) UNUSED;
static void  _DML_IFACE_regs__bank_instrumentation_subscribe__remove_callback(conf_object_t *_obj, bank_callback_handle_t callback) UNUSED;
static void  _DML_IFACE_regs__bank_instrumentation_subscribe__remove_connection_callbacks(conf_object_t *_obj, conf_object_t *connection) UNUSED;
static attr_value_t _DML_PIFACE_regs__instrumentation_order__get_connections(conf_object_t *_obj) UNUSED;
static bool _DML_PIFACE_regs__instrumentation_order__move_before(conf_object_t *_obj, conf_object_t *connection, conf_object_t *before) UNUSED;
static attr_value_t _DML_IFACE_regs__instrumentation_order__get_connections(conf_object_t *_obj) UNUSED;
static bool _DML_IFACE_regs__instrumentation_order__move_before(conf_object_t *_obj, conf_object_t *connection, conf_object_t *before) UNUSED;
static exception_type_t _DML_PIFACE_regs__io_memory__operation(conf_object_t *_obj, generic_transaction_t *mem_op, map_info_t map_info) UNUSED;
static exception_type_t _DML_IFACE_regs__io_memory__operation(conf_object_t *_obj, generic_transaction_t *mem_op, map_info_t map_info) UNUSED;
static bool _DML_PIFACE_regs__register_view__big_endian_bitorder(conf_object_t *_obj) UNUSED;
static char const *_DML_PIFACE_regs__register_view__description(conf_object_t *_obj) UNUSED;
static uint64 _DML_PIFACE_regs__register_view__get_register_value(conf_object_t *_obj, uint32 reg) UNUSED;
static uint32 _DML_PIFACE_regs__register_view__number_of_registers(conf_object_t *_obj) UNUSED;
static attr_value_t _DML_PIFACE_regs__register_view__register_info(conf_object_t *_obj, uint32 reg) UNUSED;
static void  _DML_PIFACE_regs__register_view__set_register_value(conf_object_t *_obj, uint32 reg, uint64 val) UNUSED;
static bool _DML_IFACE_regs__register_view__big_endian_bitorder(conf_object_t *_obj) UNUSED;
static char const *_DML_IFACE_regs__register_view__description(conf_object_t *_obj) UNUSED;
static uint64 _DML_IFACE_regs__register_view__get_register_value(conf_object_t *_obj, uint32 reg) UNUSED;
static uint32 _DML_IFACE_regs__register_view__number_of_registers(conf_object_t *_obj) UNUSED;
static attr_value_t _DML_IFACE_regs__register_view__register_info(conf_object_t *_obj, uint32 reg) UNUSED;
static void  _DML_IFACE_regs__register_view__set_register_value(conf_object_t *_obj, uint32 reg, uint64 val) UNUSED;
static bool _DML_PIFACE_regs__register_view_read_only__is_read_only(conf_object_t *_obj, uint32 reg) UNUSED;
static bool _DML_IFACE_regs__register_view_read_only__is_read_only(conf_object_t *_obj, uint32 reg) UNUSED;
static void
 dma_device_notify_state_change(dma_device_t *dev) UNUSED;
static void _dma_device_update_has_state_notifier(conf_object_t *_obj, notifier_type_t type, bool has_subscribers) UNUSED;
static conf_object_t *
dma_device_alloc(conf_class_t *cls) UNUSED;
static void dma_device_pre_del_notify(conf_object_t *_subscriber, conf_object_t *_notifier, lang_void *_data) UNUSED;
static lang_void *
dma_device_init(conf_object_t *_obj) UNUSED;
static void dma_device_finalize(conf_object_t *_obj) UNUSED;
static void dma_device_deinit(conf_object_t *_obj) UNUSED;
static void dma_device_dealloc(conf_object_t *dev) UNUSED;
static const _id_info_t _id_infos[19] UNUSED;
static ht_str_table_t _id_info_ht UNUSED;
static void * const _object_vtables[19] UNUSED;
static conf_class_t *_dev_class UNUSED;
static void _startup_calls(void) UNUSED;
static void _init_data_objs(dma_device_t *_dev) UNUSED;
static char const *_DML_TM__qname___qname(dma_device_t *_dev, _qname __qname) UNUSED;
static void  _DML_TM_object__cancel_after(dma_device_t *_dev, object _object) UNUSED;
static _register const *_DML_TM_bank___reginfo_table(bank _bank, uint64 *_out1) UNUSED;
static bool _DML_TM_bank___get_register(dma_device_t *_dev, bank _bank, uint32 reg, _register *_out0) UNUSED;
static uint32 _DML_TM_bank___num_registers(dma_device_t *_dev, bank _bank) UNUSED;
static int _DML_TM_bank___intersect(dma_device_t *_dev, bank _bank, uint64 offset, uint64 size, uint64 roffset, uint64 rsize, bool endian_swap, int *_out1) UNUSED;
static _register const *_DML_TM_bank___sorted_regs(bank _bank, int *_out1) UNUSED;
static int _DML_TM_bank___dispatch(dma_device_t *_dev, bank _bank, uint64 offset, uint64 size, _register *hits, bool inquiry, uint64 *_out1) UNUSED;
static bool _DML_TM_bank__unmapped_read(dma_device_t *_dev, bank _bank, uint64 offset, uint64 bits, void  *aux, uint64 *_out0) UNUSED;
static bool _DML_TM_bank__unmapped_write(dma_device_t *_dev, bank _bank, uint64 offset, uint64 value, uint64 bits, void  *aux) UNUSED;
static bool _DML_TM_bank__read(dma_device_t *_dev, bank _bank, uint64 offset, uint64 enabled_bytes, void  *aux, uint64 *_out0) UNUSED;
static bool _DML_TM_bank__unmapped_get(dma_device_t *_dev, bank _bank, uint64 offset, uint64 bits, uint64 *_out0) UNUSED;
static bool _DML_TM_bank__get(dma_device_t *_dev, bank _bank, uint64 offset, uint64 size, uint64 *_out0) UNUSED;
static bool _DML_TM_bank__write(dma_device_t *_dev, bank _bank, uint64 offset, uint64 value, uint64 enabled_bytes, void  *aux) UNUSED;
static void  _DML_TM_bank__set(dma_device_t *_dev, bank _bank, uint64 offset, uint64 size, uint64 value) UNUSED;
static void  _DML_TM_bank___memop_set_read_value(dma_device_t *_dev, bank _bank, generic_transaction_t *memop, uint64 val) UNUSED;
static uint64 _DML_TM_bank___memop_write_value(dma_device_t *_dev, bank _bank, generic_transaction_t *memop) UNUSED;
static void  _DML_TM_bank___set_read_value(dma_device_t *_dev, bank _bank, uint64 size, uint8 *buf, uint64 val) UNUSED;
static uint64 _DML_TM_bank___write_value(dma_device_t *_dev, bank _bank, uint64 size, uint8 const *buf) UNUSED;
static conf_object_t *_DML_TM_bank___bank_obj(dma_device_t *_dev, bank _bank) UNUSED;
static bool _DML_TM_bank__io_memory_access(dma_device_t *_dev, bank _bank, generic_transaction_t *memop, uint64 offset, void  *aux) UNUSED;
static exception_type_t _DML_TM_bank__transaction_access(dma_device_t *_dev, bank _bank, transaction_t *t, uint64 offset, void  *aux) UNUSED;
static bool _DML_TM_bank___transaction_access(dma_device_t *_dev, bank _bank, conf_object_t *ini, bool is_read, bool inquiry, uint64 offset, uint64 size, uint8 *buf, void  *aux) UNUSED;
static uint64 _DML_TM__get__get(dma_device_t *_dev, _get __get) UNUSED;
static void  _DML_TM__set__set(dma_device_t *_dev, _set __set, uint64 value) UNUSED;
static void  _DML_TM_init___rec_init(dma_device_t *_dev, init _init) UNUSED;
static void  _DML_TM_init_val__init(dma_device_t *_dev, init _init) UNUSED;
static set_error_t _DML_TM_register__set_attribute(dma_device_t *_dev, _conf_attribute __conf_attribute, attr_value_t value) UNUSED;
static attr_value_t _DML_TM_register__get_attribute(dma_device_t *_dev, _conf_attribute __conf_attribute) UNUSED;
static int _DML_TM_register___size(dma_device_t *_dev, _register __register) UNUSED;
static uint32 _DML_TM_register___num_fields(dma_device_t *_dev, _register __register) UNUSED;
static uint64 _DML_TM_register___field_bits(dma_device_t *_dev, _register __register) UNUSED;
static int _DML_TM_register___get_all_fields(dma_device_t *_dev, _register __register, field *fields, uint64 *_out1) UNUSED;
static int _DML_TM_register___get_get_fields(dma_device_t *_dev, _register __register, _get_field *fields, uint64 *_out1) UNUSED;
static int _DML_TM_register___get_set_fields(dma_device_t *_dev, _register __register, _set_field *fields, uint64 *_out1) UNUSED;
static int _DML_TM_register___get_write_fields(dma_device_t *_dev, _register __register, _write_field *fields, uint64 *_out1) UNUSED;
static int _DML_TM_register___get_read_fields(dma_device_t *_dev, _register __register, _read_field *fields, uint64 *_out1) UNUSED;
static void  _DML_TM_register___default_init(dma_device_t *_dev, init_val _init_val) UNUSED;
static uint64 _DML_TM_register__read_unmapped_bits(dma_device_t *_dev, _register __register, uint64 enabled_bits, void  *aux) UNUSED;
static uint64 _DML_TM_register__read_register(dma_device_t *_dev, read_register _read_register, uint64 enabled_bytes, void  *aux) UNUSED;
static void  _DML_TM_register__write_unmapped_bits(dma_device_t *_dev, _register __register, uint64 value, uint64 enabled_bits, void  *aux) UNUSED;
static void  _DML_TM_register__write_register(dma_device_t *_dev, write_register _write_register, uint64 value, uint64 enabled_bytes, void  *aux) UNUSED;
static void  _DML_TM_register__set_val(dma_device_t *_dev, set_val _set_val, uint64 value) UNUSED;
static uint64 _DML_TM_register__get_val(dma_device_t *_dev, get_val _get_val) UNUSED;
static uint64 _DML_TM_register___default_get(dma_device_t *_dev, get_val _get_val) UNUSED;
static void  _DML_TM_register___default_set(dma_device_t *_dev, set_val _set_val, uint64 value) UNUSED;
static uint64 _DML_TM_field__get_val(dma_device_t *_dev, get_val _get_val) UNUSED;
static void  _DML_TM_field__set_val(dma_device_t *_dev, set_val _set_val, uint64 val) UNUSED;
static uint64 _DML_TM_field___default_get(dma_device_t *_dev, get_val _get_val) UNUSED;
static void  _DML_TM_field___default_set(dma_device_t *_dev, set_val _set_val, uint64 value) UNUSED;
static void  _DML_TM_field___default_init(dma_device_t *_dev, init_val _init_val) UNUSED;
static uint64 _DML_TM__log_unimpl_read__read_field(dma_device_t *_dev, read_field _read_field, uint64 enabled_bits, void  *aux) UNUSED;
static void  _DML_TM__simple_write___simple_write(dma_device_t *_dev, _simple_write __simple_write, uint64 value, uint64 enabled_bits) UNUSED;
static void  _DML_TM__log_unimpl_write__write_field(dma_device_t *_dev, write_field _write_field, uint64 val, uint64 enabled_bits, void  *aux) UNUSED;
static void  _DML_TM_read_only__write_field(dma_device_t *_dev, write_field _write_field, uint64 val, uint64 enabled_bits, void  *aux) UNUSED;
static bool _DML_TM_connect__validate(dma_device_t *_dev, _connect __connect, conf_object_t *obj) UNUSED;
static set_error_t _DML_TM_connect__set_attribute(dma_device_t *_dev, _conf_attribute __conf_attribute, attr_value_t value) UNUSED;
static void  _DML_TM_connect__set(dma_device_t *_dev, _connect __connect, conf_object_t *obj) UNUSED;
static attr_value_t _DML_TM_connect__get_attribute(dma_device_t *_dev, _conf_attribute __conf_attribute) UNUSED;
static void  _DML_TM_post_init___rec_post_init(dma_device_t *_dev, post_init _post_init) UNUSED;
static void  _DML_TM__reg_write_as_field__write_register(dma_device_t *_dev, write_register _write_register, uint64 val, uint64 enabled_bytes, void  *aux) UNUSED;
static uint64 _DML_TM__reg_read_as_field__read_register(dma_device_t *_dev, read_register _read_register, uint64 enabled_bytes, void  *aux) UNUSED;
static void  _DML_TM_power_on_reset__power_on_reset(dma_device_t *_dev, power_on_reset _power_on_reset) UNUSED;
static void  _DML_TM_power_on_reset___default_power_on_reset(dma_device_t *_dev, power_on_reset _power_on_reset) UNUSED;
static void  _DML_TM_power_on_reset__power_on_reset_subobjs(dma_device_t *_dev, power_on_reset _power_on_reset) UNUSED;
static void  _DML_TM__init_val_power_on_reset___default_power_on_reset(dma_device_t *_dev, power_on_reset _power_on_reset) UNUSED;
static conf_object_t *_DML_TM_port___port_obj(dma_device_t *_dev, port _port) UNUSED;
static void  _DML_TM_hard_reset__hard_reset(dma_device_t *_dev, _hard_reset __hard_reset) UNUSED;
static void  _DML_TM_hard_reset___default_hard_reset(dma_device_t *_dev, _hard_reset __hard_reset) UNUSED;
static void  _DML_TM_hard_reset__hard_reset_subobjs(dma_device_t *_dev, _hard_reset __hard_reset) UNUSED;
static void  _DML_TM__init_val_hard_reset___default_hard_reset(dma_device_t *_dev, _hard_reset __hard_reset) UNUSED;
static void  _DML_TM_soft_reset__soft_reset(dma_device_t *_dev, _soft_reset __soft_reset) UNUSED;
static void  _DML_TM_soft_reset___default_soft_reset(dma_device_t *_dev, _soft_reset __soft_reset) UNUSED;
static void  _DML_TM_soft_reset__soft_reset_subobjs(dma_device_t *_dev, _soft_reset __soft_reset) UNUSED;
static void  _DML_TM__init_val_soft_reset___default_soft_reset(dma_device_t *_dev, _soft_reset __soft_reset) UNUSED;
static void  _DML_TM_soft_reset_val__soft_reset(dma_device_t *_dev, _soft_reset __soft_reset) UNUSED;
static uint64 _DML_TM_write_only__read_field(dma_device_t *_dev, read_field _read_field, uint64 enabled_bits, void  *aux) UNUSED;
static void  _DML_TM_write_1_clears__write_field(dma_device_t *_dev, write_field _write_field, uint64 value, uint64 enabled_bits, void  *aux) UNUSED;
static uint64 _DML_TM_clear_on_read__read_field(dma_device_t *_dev, read_field _read_field, uint64 enabled_bits, void  *aux) UNUSED;
static void  _DML_TM_write_1_only__write_field(dma_device_t *_dev, write_field _write_field, uint64 value, uint64 enabled_bits, void  *aux) UNUSED;
static void  _DML_TM_write_0_only__write_field(dma_device_t *_dev, write_field _write_field, uint64 value, uint64 enabled_bits, void  *aux) UNUSED;
static void  _DML_TM_no_reset__power_on_reset(dma_device_t *_dev, power_on_reset _power_on_reset) UNUSED;
static void  _DML_TM_no_reset__hard_reset(dma_device_t *_dev, _hard_reset __hard_reset) UNUSED;
static void  _DML_TM_no_reset__soft_reset(dma_device_t *_dev, _soft_reset __soft_reset) UNUSED;
static void  _DML_TM_constant__write_field(dma_device_t *_dev, write_field _write_field, uint64 val, uint64 enabled_bits, void  *aux) UNUSED;
static void  _DML_TM_reserved__write_field(dma_device_t *_dev, write_field _write_field, uint64 val, uint64 enabled_bits, void  *aux) UNUSED;
static void  _DML_TM_silent_unimpl__write_field(dma_device_t *_dev, write_field _write_field, uint64 val, uint64 enabled_bits, void  *aux) UNUSED;
static uint64 _DML_TM_silent_unimpl__read_field(dma_device_t *_dev, read_field _read_field, uint64 enabled_bits, void  *aux) UNUSED;
static void  _DML_TM_undocumented__write_field(dma_device_t *_dev, write_field _write_field, uint64 val, uint64 enabled_bits, void  *aux) UNUSED;
static uint64 _DML_TM_undocumented__read_field(dma_device_t *_dev, read_field _read_field, uint64 enabled_bits, void  *aux) UNUSED;
static void  _DML_TM_sticky__soft_reset(dma_device_t *_dev, _soft_reset __soft_reset) UNUSED;
static bool _DML_TM_miss_pattern_bank__unmapped_read(dma_device_t *_dev, bank _bank, uint64 offset, uint64 bits, void  *aux, uint64 *_out0) UNUSED;
static bool _DML_TM_miss_pattern_bank__unmapped_get(dma_device_t *_dev, bank _bank, uint64 offset, uint64 bits, uint64 *_out0) UNUSED;
static bool _DML_TM_miss_pattern_bank__unmapped_write(dma_device_t *_dev, bank _bank, uint64 offset, uint64 value, uint64 bits, void  *aux) UNUSED;
static conf_object_t *_DML_TM_bank_obj__bank_obj(dma_device_t *_dev, bank_obj _bank_obj) UNUSED;
static bool _DML_TM_map_target__read(dma_device_t *_dev, map_target _map_target, uint64 addr, uint64 size, uint64 *_out0) UNUSED;
static bool _DML_TM_map_target__read_bytes(dma_device_t *_dev, map_target _map_target, uint64 addr, uint64 size, uint8 *bytes) UNUSED;
static bool _DML_TM_map_target__write(dma_device_t *_dev, map_target _map_target, uint64 addr, uint64 size, uint64 value) UNUSED;
static bool _DML_TM_map_target__write_bytes(dma_device_t *_dev, map_target _map_target, uint64 addr, uint64 size, uint8 const *bytes) UNUSED;
static set_error_t _DML_TM_attribute__set_attribute(dma_device_t *_dev, _conf_attribute __conf_attribute, attr_value_t value) UNUSED;
static attr_value_t _DML_TM_attribute__get_attribute(dma_device_t *_dev, _conf_attribute __conf_attribute) UNUSED;
static void  _DML_TM_bool_attr__init(dma_device_t *_dev, init _init) UNUSED;
static attr_value_t _DML_TM_bool_attr__get(dma_device_t *_dev, attribute _attribute) UNUSED;
static bool _DML_TM_bool_attr__set(dma_device_t *_dev, attribute _attribute, attr_value_t val) UNUSED;
static void  _DML_TM_uint64_attr__init(dma_device_t *_dev, init _init) UNUSED;
static attr_value_t _DML_TM_uint64_attr__get(dma_device_t *_dev, attribute _attribute) UNUSED;
static bool _DML_TM_uint64_attr__set(dma_device_t *_dev, attribute _attribute, attr_value_t val) UNUSED;
static void  _DML_TM_int64_attr__init(dma_device_t *_dev, init _init) UNUSED;
static attr_value_t _DML_TM_int64_attr__get(dma_device_t *_dev, attribute _attribute) UNUSED;
static bool _DML_TM_int64_attr__set(dma_device_t *_dev, attribute _attribute, attr_value_t val) UNUSED;
static void  _DML_TM_double_attr__init(dma_device_t *_dev, init _init) UNUSED;
static attr_value_t _DML_TM_double_attr__get(dma_device_t *_dev, attribute _attribute) UNUSED;
static bool _DML_TM_double_attr__set(dma_device_t *_dev, attribute _attribute, attr_value_t val) UNUSED;
static bool _DML_TM_read_only_attr__set(dma_device_t *_dev, attribute _attribute, attr_value_t val) UNUSED;
static attr_value_t _DML_TM_write_only_attr__get(dma_device_t *_dev, attribute _attribute) UNUSED;
static conf_object_t *_DML_TM_subdevice___port_obj(dma_device_t *_dev, subdevice _subdevice) UNUSED;
static uint64 _DML_TM_read__read_field(dma_device_t *_dev, read_field _read_field, uint64 enabled_bits, void  *aux) UNUSED;
static uint64 _DML_TM_read__read(dma_device_t *_dev, __read ___read) UNUSED;
static void  _DML_TM_write__write_field(dma_device_t *_dev, write_field _write_field, uint64 val, uint64 enabled_bits, void  *aux) UNUSED;
static void  _DML_TM_write__write(dma_device_t *_dev, __write ___write, uint64 val) UNUSED;
static void  _DML_TM__time_event___post(dma_device_t *_dev, _time_event __time_event, double when, void  *data) UNUSED;
static double _DML_TM__time_event___next(dma_device_t *_dev, _time_event __time_event, void  *data) UNUSED;
static void  _DML_TM__cycle_event___post(dma_device_t *_dev, _cycle_event __cycle_event, uint64 when, void  *data) UNUSED;
static uint64 _DML_TM__cycle_event___next(dma_device_t *_dev, _cycle_event __cycle_event, void  *data) UNUSED;
static char *_DML_TM__simple_event___describe_event(dma_device_t *_dev, event _event, void  *data) UNUSED;
static attr_value_t _DML_TM__simple_event___get_event_info(dma_device_t *_dev, event _event, void  *data) UNUSED;
static void  *_DML_TM__simple_event___set_event_info(dma_device_t *_dev, event _event, attr_value_t info) UNUSED;
static void  _DML_TM__simple_event___callback(dma_device_t *_dev, event _event, void  *data) UNUSED;
static void  _DML_TM__simple_event___destroy(dma_device_t *_dev, event _event, void  *data) UNUSED;
static bool _DML_TM__simple_event__posted(dma_device_t *_dev, _simple_event __simple_event) UNUSED;
static void  _DML_TM__simple_event__remove(dma_device_t *_dev, _simple_event __simple_event) UNUSED;
static void  _DML_TM_simple_time_event__post(dma_device_t *_dev, simple_time_event _simple_time_event, double when) UNUSED;
static double _DML_TM_simple_time_event__next(dma_device_t *_dev, simple_time_event _simple_time_event) UNUSED;
static void  _DML_TM_simple_cycle_event__post(dma_device_t *_dev, simple_cycle_event _simple_cycle_event, cycles_t when) UNUSED;
static cycles_t _DML_TM_simple_cycle_event__next(dma_device_t *_dev, simple_cycle_event _simple_cycle_event) UNUSED;
static void  _DML_TM__custom_event___callback(dma_device_t *_dev, event _event, void  *data) UNUSED;
static char *_DML_TM__custom_event___describe_event(dma_device_t *_dev, event _event, void  *data) UNUSED;
static attr_value_t _DML_TM__custom_event___get_event_info(dma_device_t *_dev, event _event, void  *data) UNUSED;
static void  *_DML_TM__custom_event___set_event_info(dma_device_t *_dev, event _event, attr_value_t info) UNUSED;
static void  _DML_TM__custom_event___destroy(dma_device_t *_dev, event _event, void  *data) UNUSED;
static void  _DML_TM_custom_time_event__post(dma_device_t *_dev, custom_time_event _custom_time_event, double when, void  *data) UNUSED;
static void  _DML_TM_custom_cycle_event__post(dma_device_t *_dev, custom_cycle_event _custom_cycle_event, cycles_t when, void  *data) UNUSED;
static void  _DML_TM__uint64_event___callback(dma_device_t *_dev, event _event, void  *user) UNUSED;
static char *_DML_TM__uint64_event___describe_event(dma_device_t *_dev, event _event, void  *data) UNUSED;
static attr_value_t _DML_TM__uint64_event___get_event_info(dma_device_t *_dev, event _event, void  *data) UNUSED;
static void  *_DML_TM__uint64_event___set_event_info(dma_device_t *_dev, event _event, attr_value_t info) UNUSED;
static void  _DML_TM__uint64_event___destroy(dma_device_t *_dev, event _event, void  *data) UNUSED;
static void  *_DML_TM__uint64_event___int_to_voidp(dma_device_t *_dev, _uint64_event __uint64_event, uint64 val) UNUSED;
static bool _DML_TM__uint64_event__posted(dma_device_t *_dev, _uint64_event __uint64_event, uint64 data) UNUSED;
static void  _DML_TM__uint64_event__remove(dma_device_t *_dev, _uint64_event __uint64_event, uint64 data) UNUSED;
static void  _DML_TM_uint64_time_event__post(dma_device_t *_dev, uint64_time_event _uint64_time_event, double when, uint64 data) UNUSED;
static double _DML_TM_uint64_time_event__next(dma_device_t *_dev, uint64_time_event _uint64_time_event, uint64 data) UNUSED;
static void  _DML_TM_uint64_cycle_event__post(dma_device_t *_dev, uint64_cycle_event _uint64_cycle_event, cycles_t when, uint64 data) UNUSED;
static cycles_t _DML_TM_uint64_cycle_event__next(dma_device_t *_dev, uint64_cycle_event _uint64_cycle_event, uint64 data) UNUSED;
static uint64 _DML_M__enabled_bytes_to_offset(dma_device_t *_dev, uint64 enabled_bytes) UNUSED;
static uint64 _DML_M__mask(dma_device_t *_dev, uint64 size) UNUSED;
static uint64 _DML_M__enabled_bytes_to_size(dma_device_t *_dev, uint64 enabled_bytes) UNUSED;
static void  _DML_M_regs__DMA_control__write_register(dma_device_t *_dev, uint64 value, uint64 enabled_bytes, void  *aux) UNUSED;
static void  _DML_M_regs__do_dma_transfer(dma_device_t *_dev) UNUSED;
static void  _DML_M_regs__complete_dma(dma_device_t *_dev) UNUSED;
static bool _DML_M_write_mem(dma_device_t *_dev, physical_address_t dst, void const  *src, physical_address_t len) UNUSED;
static bool _DML_M_read_mem(dma_device_t *_dev, void  *dst, physical_address_t src, physical_address_t len) UNUSED;
static exception_type_t _DML_M_regs__transaction_access(dma_device_t *_dev, transaction_t *t, uint64 offset, void  *aux) UNUSED;
static void  _DML_M_post_init(dma_device_t *_dev) UNUSED;
static void  _DML_M_init(dma_device_t *_dev) UNUSED;
static bool _DML_M_regs__register_view_read_only__is_read_only(dma_device_t *_dev, uint32 reg) UNUSED;
static void  _DML_M_regs__register_view__set_register_value(dma_device_t *_dev, uint32 reg, uint64 val) UNUSED;
static attr_value_t _DML_M_regs__register_view__register_info(dma_device_t *_dev, uint32 reg) UNUSED;
static uint32 _DML_M_regs__register_view__number_of_registers(dma_device_t *_dev) UNUSED;
static uint64 _DML_M_regs__register_view__get_register_value(dma_device_t *_dev, uint32 reg) UNUSED;
static char const *_DML_M_regs__register_view__description(dma_device_t *_dev) UNUSED;
static bool _DML_M_regs__register_view__big_endian_bitorder(dma_device_t *_dev) UNUSED;
static exception_type_t _DML_M_regs__io_memory__operation(dma_device_t *_dev, generic_transaction_t *mem_op, map_info_t map_info) UNUSED;
static bool _DML_M_regs__instrumentation_order__move_before(dma_device_t *_dev, conf_object_t *connection, conf_object_t *before) UNUSED;
static attr_value_t _DML_M_regs__instrumentation_order__get_connections(dma_device_t *_dev) UNUSED;
static void  _DML_M_regs__bank_instrumentation_subscribe__remove_connection_callbacks(dma_device_t *_dev, conf_object_t *connection) UNUSED;
static void  _DML_M_regs__bank_instrumentation_subscribe__remove_callback(dma_device_t *_dev, bank_callback_handle_t callback) UNUSED;
static bank_callback_handle_t _DML_M_regs__bank_instrumentation_subscribe__register_before_write(dma_device_t *_dev, conf_object_t *connection, uint64 offset, uint64 size, before_write_callback_t before_write, void  *user_data) UNUSED;
static bank_callback_handle_t _DML_M_regs__bank_instrumentation_subscribe__register_before_read(dma_device_t *_dev, conf_object_t *connection, uint64 offset, uint64 size, before_read_callback_t before_read, void  *user_data) UNUSED;
static bank_callback_handle_t _DML_M_regs__bank_instrumentation_subscribe__register_after_write(dma_device_t *_dev, conf_object_t *connection, uint64 offset, uint64 size, after_write_callback_t after_write, void  *user_data) UNUSED;
static bank_callback_handle_t _DML_M_regs__bank_instrumentation_subscribe__register_after_read(dma_device_t *_dev, conf_object_t *connection, uint64 offset, uint64 size, after_read_callback_t after_read, void  *user_data) UNUSED;
static void  _DML_M_regs__bank_instrumentation_subscribe__enable_connection_callbacks(dma_device_t *_dev, conf_object_t *connection) UNUSED;
static void  _DML_M_regs__bank_instrumentation_subscribe__disable_connection_callbacks(dma_device_t *_dev, conf_object_t *connection) UNUSED;
static void  _DML_M__register_all_attributes() UNUSED;
static set_error_t _DML_M__set_attribute_attr_portobj_trampoline(void  *_info, conf_object_t *_portobj, attr_value_t *val, attr_value_t *_idx) UNUSED;
static set_error_t _DML_M__set_attribute_attr(dma_device_t *_dev, _dml_attr_getset_info_t const *_conf_info, uint32 start_dim, uint32 flat_index_offset, attr_value_t *val) UNUSED;
static attr_value_t _DML_M__get_attribute_attr_portobj_trampoline(void  *_info, conf_object_t *_portobj, attr_value_t *_idx) UNUSED;
static attr_value_t _DML_M__get_attribute_attr(dma_device_t *_dev, _dml_attr_getset_info_t const *_conf_info, uint32 start_dim, uint32 flat_index_offset) UNUSED;
static set_error_t _DML_M__set_attribute_attr_trampoline(void  *info, conf_object_t *obj, attr_value_t *val, attr_value_t *_idx) UNUSED;
static attr_value_t _DML_M__get_attribute_attr_trampoline(void  *info, conf_object_t *obj, attr_value_t *_idx) UNUSED;
static _dml_attr_conf_info_t _DML_M__get_attribute_info(_conf_attribute attr) UNUSED;
static void _initialize_vtable_hts(void) UNUSED;
static struct _device _tr__dev__device UNUSED;
static struct _bank _tr_regs__bank UNUSED;
static struct __register _tr_regs_DMA_control__register UNUSED;
static struct ___implicit__read_field___write_field__field__unimpl _tr_regs_DMA_control_ECI____implicit__read_field___write_field__field__unimpl UNUSED;
static struct _field _tr_regs_DMA_control_EN__field UNUSED;
static struct _field _tr_regs_DMA_control_ERR__field UNUSED;
static struct ___implicit__read_field___write_field__field__unimpl _tr_regs_DMA_control_SG____implicit__read_field___write_field__field__unimpl UNUSED;
static struct _field _tr_regs_DMA_control_SWT__field UNUSED;
static struct ___implicit__write_field__field__read_only _tr_regs_DMA_control_TC____implicit__write_field__field__read_only UNUSED;
static struct _field _tr_regs_DMA_control_TS__field UNUSED;
static struct __register _tr_regs_DMA_dest__register UNUSED;
static struct __register _tr_regs_DMA_source__register UNUSED;
static struct _implement _tr_regs_bank_instrumentation_subscribe__implement UNUSED;
static struct _implement _tr_regs_instrumentation_order__implement UNUSED;
static struct _bank_io_memory _tr_regs_io_memory__bank_io_memory UNUSED;
static struct _implement _tr_regs_register_view__implement UNUSED;
static struct _implement _tr_regs_register_view_read_only__implement UNUSED;
static struct __connect _tr_target_mem_space__connect UNUSED;
static struct __interface _tr_target_mem_space_memory_space__interface UNUSED;
static void __attribute__((optimize("O0"))) _initialize_traits(void) UNUSED;
static const uint32 _each__init__in__dev UNUSED;
static const uint32 _each__init__in__regs_DMA_control UNUSED;
static const _vtable_list_t _each__init[10] UNUSED;
static const _vtable_list_t *const _each__post_init UNUSED;
static const uint32 _each__register__in__regs UNUSED;
static const _vtable_list_t _each__register[3] UNUSED;
static const uint32 _each__field__in__regs_DMA_control UNUSED;
static const _vtable_list_t _each__field[7] UNUSED;
static const _vtable_list_t *const _each___get_field UNUSED;
static const _vtable_list_t *const _each___set_field UNUSED;
static const uint32 _each___read_field__in__regs_DMA_control UNUSED;
static const _vtable_list_t _each___read_field[2] UNUSED;
static const uint32 _each___write_field__in__regs_DMA_control UNUSED;
static const _vtable_list_t _each___write_field[3] UNUSED;
static const uint32 _each__interface__in__target_mem_space UNUSED;
static const _vtable_list_t _each__interface[1] UNUSED;
static const uint32 _each___conf_attribute__in__dev UNUSED;
static const _vtable_list_t _each___conf_attribute[4] UNUSED;
static const _vtable_list_t *const _each__name UNUSED;
static const _vtable_list_t *const _each___qname UNUSED;
static const _vtable_list_t *const _each__desc UNUSED;
static const _vtable_list_t *const _each__documentation UNUSED;
static const _vtable_list_t *const _each__limitations UNUSED;
static const _vtable_list_t *const _each__object UNUSED;
static const _vtable_list_t *const _each__implement UNUSED;
static const _vtable_list_t *const _each__bank_transaction UNUSED;
static const _vtable_list_t *const _each__bank_io_memory UNUSED;
static const _vtable_list_t *const _each__shown_desc UNUSED;
static const _vtable_list_t *const _each__bank UNUSED;
static const _vtable_list_t *const _each__get_val UNUSED;
static const _vtable_list_t *const _each___get UNUSED;
static const _vtable_list_t *const _each__get UNUSED;
static const _vtable_list_t *const _each__set_val UNUSED;
static const _vtable_list_t *const _each___set UNUSED;
static const _vtable_list_t *const _each__set UNUSED;
static const _vtable_list_t *const _each___bitsize UNUSED;
static const _vtable_list_t *const _each__read_register UNUSED;
static const _vtable_list_t *const _each__write_register UNUSED;
static const _vtable_list_t *const _each__init_val UNUSED;
static const _vtable_list_t *const _each___lsb UNUSED;
static const _vtable_list_t *const _each__read_field UNUSED;
static const _vtable_list_t *const _each___reg_or_field UNUSED;
static const _vtable_list_t *const _each___log_unimpl_read UNUSED;
static const _vtable_list_t *const _each__write_field UNUSED;
static const _vtable_list_t *const _each___simple_write UNUSED;
static const _vtable_list_t *const _each___log_unimpl_write UNUSED;
static const _vtable_list_t *const _each__unimpl UNUSED;
static const _vtable_list_t *const _each__read_only UNUSED;
static const _vtable_list_t *const _each__connect UNUSED;
static const _vtable_list_t *const _each__device UNUSED;
static const _vtable_list_t *const _each___reg_write_as_field UNUSED;
static const _vtable_list_t *const _each___reg_read_as_field UNUSED;
static const _vtable_list_t *const _each__power_on_reset UNUSED;
static const _vtable_list_t *const _each___init_val_power_on_reset UNUSED;
static const _vtable_list_t *const _each__signal_port UNUSED;
static const _vtable_list_t *const _each__signal_connect UNUSED;
static const _vtable_list_t *const _each__port UNUSED;
static const _vtable_list_t *const _each__poreset UNUSED;
static const _vtable_list_t *const _each__hard_reset UNUSED;
static const _vtable_list_t *const _each___init_val_hard_reset UNUSED;
static const _vtable_list_t *const _each__hreset UNUSED;
static const _vtable_list_t *const _each__soft_reset UNUSED;
static const _vtable_list_t *const _each___init_val_soft_reset UNUSED;
static const _vtable_list_t *const _each__sreset UNUSED;
static const _vtable_list_t *const _each__soft_reset_val UNUSED;
static const _vtable_list_t *const _each__ignore_write UNUSED;
static const _vtable_list_t *const _each__read_zero UNUSED;
static const _vtable_list_t *const _each__write_only UNUSED;
static const _vtable_list_t *const _each__write_1_clears UNUSED;
static const _vtable_list_t *const _each__clear_on_read UNUSED;
static const _vtable_list_t *const _each__write_1_only UNUSED;
static const _vtable_list_t *const _each__write_0_only UNUSED;
static const _vtable_list_t *const _each__read_constant UNUSED;
static const _vtable_list_t *const _each__no_reset UNUSED;
static const _vtable_list_t *const _each__constant UNUSED;
static const _vtable_list_t *const _each__silent_constant UNUSED;
static const _vtable_list_t *const _each__zeros UNUSED;
static const _vtable_list_t *const _each__ones UNUSED;
static const _vtable_list_t *const _each__ignore UNUSED;
static const _vtable_list_t *const _each__reserved UNUSED;
static const _vtable_list_t *const _each__read_unimpl UNUSED;
static const _vtable_list_t *const _each__write_unimpl UNUSED;
static const _vtable_list_t *const _each__silent_unimpl UNUSED;
static const _vtable_list_t *const _each__undocumented UNUSED;
static const _vtable_list_t *const _each__unmapped UNUSED;
static const _vtable_list_t *const _each__sticky UNUSED;
static const _vtable_list_t *const _each__design_limitation UNUSED;
static const _vtable_list_t *const _each__function_mapped_bank UNUSED;
static const _vtable_list_t *const _each__function_io_memory UNUSED;
static const _vtable_list_t *const _each__miss_pattern_bank UNUSED;
static const _vtable_list_t *const _each__bank_obj UNUSED;
static const _vtable_list_t *const _each__map_target UNUSED;
static const _vtable_list_t *const _each__group UNUSED;
static const _vtable_list_t *const _each__attribute UNUSED;
static const _vtable_list_t *const _each__bool_attr UNUSED;
static const _vtable_list_t *const _each__uint64_attr UNUSED;
static const _vtable_list_t *const _each__int64_attr UNUSED;
static const _vtable_list_t *const _each__double_attr UNUSED;
static const _vtable_list_t *const _each__pseudo_attr UNUSED;
static const _vtable_list_t *const _each__read_only_attr UNUSED;
static const _vtable_list_t *const _each__write_only_attr UNUSED;
static const _vtable_list_t *const _each__init_as_subobj UNUSED;
static const _vtable_list_t *const _each__subdevice UNUSED;
static const _vtable_list_t *const _each__read UNUSED;
static const _vtable_list_t *const _each__write UNUSED;
static const _vtable_list_t *const _each__event UNUSED;
static const _vtable_list_t *const _each___event UNUSED;
static const _vtable_list_t *const _each___time_event UNUSED;
static const _vtable_list_t *const _each___cycle_event UNUSED;
static const _vtable_list_t *const _each___simple_event UNUSED;
static const _vtable_list_t *const _each__simple_time_event UNUSED;
static const _vtable_list_t *const _each__simple_cycle_event UNUSED;
static const _vtable_list_t *const _each___custom_event UNUSED;
static const _vtable_list_t *const _each__custom_time_event UNUSED;
static const _vtable_list_t *const _each__custom_cycle_event UNUSED;
static const _vtable_list_t *const _each___uint64_event UNUSED;
static const _vtable_list_t *const _each__uint64_time_event UNUSED;
static const _vtable_list_t *const _each__uint64_cycle_event UNUSED;
static const _vtable_list_t *const _each____implicit__read_field___write_field__field__unimpl UNUSED;
static const _vtable_list_t *const _each____implicit__write_field__field__read_only UNUSED;
static attr_value_t _simple_event_only_domains_get_value(conf_object_t *_obj, lang_void *data) UNUSED;
static lang_void *_simple_event_only_domains_set_value(conf_object_t *_obj, attr_value_t val) UNUSED;
static void _cancel_simple_events(conf_object_t *_obj, _identity_t domain) UNUSED;
static void _initialize_identity_ht(void) UNUSED;
static void _register_events(conf_class_t *class) UNUSED;
static void _init_port_objs(dma_device_t *_dev) UNUSED;
static void _init_static_vars(dma_device_t *_dev) UNUSED;
static set_error_t _trampoline_DML_M__set_attribute_attr(conf_object_t *_obj, _dml_attr_getset_info_t const *_conf_info, uint32 start_dim, uint32 flat_index_offset, attr_value_t *val) UNUSED;
static attr_value_t _trampoline_DML_M__get_attribute_attr(conf_object_t *_obj, _dml_attr_getset_info_t const *_conf_info, uint32 start_dim, uint32 flat_index_offset) UNUSED;
