module AptosFramework::AptosLib {
    struct TypeInfo has copy, drop {
        account_address: address,
        module_name: vector<u8>,
        struct_name: vector<u8>,
    }

    public fun type_info_address(type_info: &TypeInfo): address {
        type_info.account_address
    }

    public fun type_info_module(type_info: &TypeInfo): vector<u8> {
        type_info.module_name
    }

    public fun type_info_name(type_info: &TypeInfo): vector<u8> {
        type_info.struct_name
    }

    native fun type_of<T>(): TypeInfo;

    #[test]
    fun test() {
        let type_info = type_of<AptosFramework::Account::Account>();
        assert!(type_info_address(&type_info) == @AptosFramework, 0);
        assert!(type_info_module(&type_info) == b"Account", 1);
        assert!(type_info_name(&type_info) == b"Account", 2);
    }
}
