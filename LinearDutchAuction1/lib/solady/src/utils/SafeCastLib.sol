// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

/// @notice Safe integer casting library that reverts on overflow.
/// @author Solady (https://github.com/vectorized/solady/blob/main/src/utils/SafeCastLib.sol)
/// @author Modified from OpenZeppelin (https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeCast.sol)
/// @dev Optimized for runtime gas for very high number of optimizer runs (i.e. >= 1000000).
library SafeCastLib {
    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*                       CUSTOM ERRORS                        */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

    /// @dev Unable to cast to the target type due to overflow.
    error Overflow();

    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*          UNSIGNED INTEGER SAFE CASTING OPERATIONS          */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

    /// @dev Casts `x` to a uint8. Reverts on overflow.
    function toUint8(uint256 x) internal pure returns (uint8) {
        if (x >= 1 << 8) _revertOverflow();
        return uint8(x);
    }

    /// @dev Casts `x` to a uint16. Reverts on overflow.
    function toUint16(uint256 x) internal pure returns (uint16) {
        if (x >= 1 << 16) _revertOverflow();
        return uint16(x);
    }

    /// @dev Casts `x` to a uint24. Reverts on overflow.
    function toUint24(uint256 x) internal pure returns (uint24) {
        if (x >= 1 << 24) _revertOverflow();
        return uint24(x);
    }

    /// @dev Casts `x` to a uint32. Reverts on overflow.
    function toUint32(uint256 x) internal pure returns (uint32) {
        if (x >= 1 << 32) _revertOverflow();
        return uint32(x);
    }

    /// @dev Casts `x` to a uint40. Reverts on overflow.
    function toUint40(uint256 x) internal pure returns (uint40) {
        if (x >= 1 << 40) _revertOverflow();
        return uint40(x);
    }

    /// @dev Casts `x` to a uint48. Reverts on overflow.
    function toUint48(uint256 x) internal pure returns (uint48) {
        if (x >= 1 << 48) _revertOverflow();
        return uint48(x);
    }

    /// @dev Casts `x` to a uint56. Reverts on overflow.
    function toUint56(uint256 x) internal pure returns (uint56) {
        if (x >= 1 << 56) _revertOverflow();
        return uint56(x);
    }

    /// @dev Casts `x` to a uint64. Reverts on overflow.
    function toUint64(uint256 x) internal pure returns (uint64) {
        if (x >= 1 << 64) _revertOverflow();
        return uint64(x);
    }

    /// @dev Casts `x` to a uint72. Reverts on overflow.
    function toUint72(uint256 x) internal pure returns (uint72) {
        if (x >= 1 << 72) _revertOverflow();
        return uint72(x);
    }

    /// @dev Casts `x` to a uint80. Reverts on overflow.
    function toUint80(uint256 x) internal pure returns (uint80) {
        if (x >= 1 << 80) _revertOverflow();
        return uint80(x);
    }

    /// @dev Casts `x` to a uint88. Reverts on overflow.
    function toUint88(uint256 x) internal pure returns (uint88) {
        if (x >= 1 << 88) _revertOverflow();
        return uint88(x);
    }

    /// @dev Casts `x` to a uint96. Reverts on overflow.
    function toUint96(uint256 x) internal pure returns (uint96) {
        if (x >= 1 << 96) _revertOverflow();
        return uint96(x);
    }

    /// @dev Casts `x` to a uint104. Reverts on overflow.
    function toUint104(uint256 x) internal pure returns (uint104) {
        if (x >= 1 << 104) _revertOverflow();
        return uint104(x);
    }

    /// @dev Casts `x` to a uint112. Reverts on overflow.
    function toUint112(uint256 x) internal pure returns (uint112) {
        if (x >= 1 << 112) _revertOverflow();
        return uint112(x);
    }

    /// @dev Casts `x` to a uint120. Reverts on overflow.
    function toUint120(uint256 x) internal pure returns (uint120) {
        if (x >= 1 << 120) _revertOverflow();
        return uint120(x);
    }

    /// @dev Casts `x` to a uint128. Reverts on overflow.
    function toUint128(uint256 x) internal pure returns (uint128) {
        if (x >= 1 << 128) _revertOverflow();
        return uint128(x);
    }

    /// @dev Casts `x` to a uint136. Reverts on overflow.
    function toUint136(uint256 x) internal pure returns (uint136) {
        if (x >= 1 << 136) _revertOverflow();
        return uint136(x);
    }

    /// @dev Casts `x` to a uint144. Reverts on overflow.
    function toUint144(uint256 x) internal pure returns (uint144) {
        if (x >= 1 << 144) _revertOverflow();
        return uint144(x);
    }

    /// @dev Casts `x` to a uint152. Reverts on overflow.
    function toUint152(uint256 x) internal pure returns (uint152) {
        if (x >= 1 << 152) _revertOverflow();
        return uint152(x);
    }

    /// @dev Casts `x` to a uint160. Reverts on overflow.
    function toUint160(uint256 x) internal pure returns (uint160) {
        if (x >= 1 << 160) _revertOverflow();
        return uint160(x);
    }

    /// @dev Casts `x` to a uint168. Reverts on overflow.
    function toUint168(uint256 x) internal pure returns (uint168) {
        if (x >= 1 << 168) _revertOverflow();
        return uint168(x);
    }

    /// @dev Casts `x` to a uint176. Reverts on overflow.
    function toUint176(uint256 x) internal pure returns (uint176) {
        if (x >= 1 << 176) _revertOverflow();
        return uint176(x);
    }

    /// @dev Casts `x` to a uint184. Reverts on overflow.
    function toUint184(uint256 x) internal pure returns (uint184) {
        if (x >= 1 << 184) _revertOverflow();
        return uint184(x);
    }

    /// @dev Casts `x` to a uint192. Reverts on overflow.
    function toUint192(uint256 x) internal pure returns (uint192) {
        if (x >= 1 << 192) _revertOverflow();
        return uint192(x);
    }

    /// @dev Casts `x` to a uint200. Reverts on overflow.
    function toUint200(uint256 x) internal pure returns (uint200) {
        if (x >= 1 << 200) _revertOverflow();
        return uint200(x);
    }

    /// @dev Casts `x` to a uint208. Reverts on overflow.
    function toUint208(uint256 x) internal pure returns (uint208) {
        if (x >= 1 << 208) _revertOverflow();
        return uint208(x);
    }

    /// @dev Casts `x` to a uint216. Reverts on overflow.
    function toUint216(uint256 x) internal pure returns (uint216) {
        if (x >= 1 << 216) _revertOverflow();
        return uint216(x);
    }

    /// @dev Casts `x` to a uint224. Reverts on overflow.
    function toUint224(uint256 x) internal pure returns (uint224) {
        if (x >= 1 << 224) _revertOverflow();
        return uint224(x);
    }

    /// @dev Casts `x` to a uint232. Reverts on overflow.
    function toUint232(uint256 x) internal pure returns (uint232) {
        if (x >= 1 << 232) _revertOverflow();
        return uint232(x);
    }

    /// @dev Casts `x` to a uint240. Reverts on overflow.
    function toUint240(uint256 x) internal pure returns (uint240) {
        if (x >= 1 << 240) _revertOverflow();
        return uint240(x);
    }

    /// @dev Casts `x` to a uint248. Reverts on overflow.
    function toUint248(uint256 x) internal pure returns (uint248) {
        if (x >= 1 << 248) _revertOverflow();
        return uint248(x);
    }

    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*           SIGNED INTEGER SAFE CASTING OPERATIONS           */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

    /// @dev Casts `x` to a int8. Reverts on overflow.
    function toInt8(int256 x) internal pure returns (int8) {
        unchecked {
            if (((1 << 7) + uint256(x)) >> 8 == uint256(0)) return int8(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int16. Reverts on overflow.
    function toInt16(int256 x) internal pure returns (int16) {
        unchecked {
            if (((1 << 15) + uint256(x)) >> 16 == uint256(0)) return int16(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int24. Reverts on overflow.
    function toInt24(int256 x) internal pure returns (int24) {
        unchecked {
            if (((1 << 23) + uint256(x)) >> 24 == uint256(0)) return int24(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int32. Reverts on overflow.
    function toInt32(int256 x) internal pure returns (int32) {
        unchecked {
            if (((1 << 31) + uint256(x)) >> 32 == uint256(0)) return int32(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int40. Reverts on overflow.
    function toInt40(int256 x) internal pure returns (int40) {
        unchecked {
            if (((1 << 39) + uint256(x)) >> 40 == uint256(0)) return int40(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int48. Reverts on overflow.
    function toInt48(int256 x) internal pure returns (int48) {
        unchecked {
            if (((1 << 47) + uint256(x)) >> 48 == uint256(0)) return int48(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int56. Reverts on overflow.
    function toInt56(int256 x) internal pure returns (int56) {
        unchecked {
            if (((1 << 55) + uint256(x)) >> 56 == uint256(0)) return int56(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int64. Reverts on overflow.
    function toInt64(int256 x) internal pure returns (int64) {
        unchecked {
            if (((1 << 63) + uint256(x)) >> 64 == uint256(0)) return int64(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int72. Reverts on overflow.
    function toInt72(int256 x) internal pure returns (int72) {
        unchecked {
            if (((1 << 71) + uint256(x)) >> 72 == uint256(0)) return int72(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int80. Reverts on overflow.
    function toInt80(int256 x) internal pure returns (int80) {
        unchecked {
            if (((1 << 79) + uint256(x)) >> 80 == uint256(0)) return int80(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int88. Reverts on overflow.
    function toInt88(int256 x) internal pure returns (int88) {
        unchecked {
            if (((1 << 87) + uint256(x)) >> 88 == uint256(0)) return int88(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int96. Reverts on overflow.
    function toInt96(int256 x) internal pure returns (int96) {
        unchecked {
            if (((1 << 95) + uint256(x)) >> 96 == uint256(0)) return int96(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int104. Reverts on overflow.
    function toInt104(int256 x) internal pure returns (int104) {
        unchecked {
            if (((1 << 103) + uint256(x)) >> 104 == uint256(0)) return int104(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int112. Reverts on overflow.
    function toInt112(int256 x) internal pure returns (int112) {
        unchecked {
            if (((1 << 111) + uint256(x)) >> 112 == uint256(0)) return int112(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int120. Reverts on overflow.
    function toInt120(int256 x) internal pure returns (int120) {
        unchecked {
            if (((1 << 119) + uint256(x)) >> 120 == uint256(0)) return int120(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int128. Reverts on overflow.
    function toInt128(int256 x) internal pure returns (int128) {
        unchecked {
            if (((1 << 127) + uint256(x)) >> 128 == uint256(0)) return int128(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int136. Reverts on overflow.
    function toInt136(int256 x) internal pure returns (int136) {
        unchecked {
            if (((1 << 135) + uint256(x)) >> 136 == uint256(0)) return int136(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int144. Reverts on overflow.
    function toInt144(int256 x) internal pure returns (int144) {
        unchecked {
            if (((1 << 143) + uint256(x)) >> 144 == uint256(0)) return int144(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int152. Reverts on overflow.
    function toInt152(int256 x) internal pure returns (int152) {
        unchecked {
            if (((1 << 151) + uint256(x)) >> 152 == uint256(0)) return int152(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int160. Reverts on overflow.
    function toInt160(int256 x) internal pure returns (int160) {
        unchecked {
            if (((1 << 159) + uint256(x)) >> 160 == uint256(0)) return int160(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int168. Reverts on overflow.
    function toInt168(int256 x) internal pure returns (int168) {
        unchecked {
            if (((1 << 167) + uint256(x)) >> 168 == uint256(0)) return int168(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int176. Reverts on overflow.
    function toInt176(int256 x) internal pure returns (int176) {
        unchecked {
            if (((1 << 175) + uint256(x)) >> 176 == uint256(0)) return int176(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int184. Reverts on overflow.
    function toInt184(int256 x) internal pure returns (int184) {
        unchecked {
            if (((1 << 183) + uint256(x)) >> 184 == uint256(0)) return int184(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int192. Reverts on overflow.
    function toInt192(int256 x) internal pure returns (int192) {
        unchecked {
            if (((1 << 191) + uint256(x)) >> 192 == uint256(0)) return int192(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int200. Reverts on overflow.
    function toInt200(int256 x) internal pure returns (int200) {
        unchecked {
            if (((1 << 199) + uint256(x)) >> 200 == uint256(0)) return int200(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int208. Reverts on overflow.
    function toInt208(int256 x) internal pure returns (int208) {
        unchecked {
            if (((1 << 207) + uint256(x)) >> 208 == uint256(0)) return int208(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int216. Reverts on overflow.
    function toInt216(int256 x) internal pure returns (int216) {
        unchecked {
            if (((1 << 215) + uint256(x)) >> 216 == uint256(0)) return int216(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int224. Reverts on overflow.
    function toInt224(int256 x) internal pure returns (int224) {
        unchecked {
            if (((1 << 223) + uint256(x)) >> 224 == uint256(0)) return int224(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int232. Reverts on overflow.
    function toInt232(int256 x) internal pure returns (int232) {
        unchecked {
            if (((1 << 231) + uint256(x)) >> 232 == uint256(0)) return int232(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int240. Reverts on overflow.
    function toInt240(int256 x) internal pure returns (int240) {
        unchecked {
            if (((1 << 239) + uint256(x)) >> 240 == uint256(0)) return int240(x);
            _revertOverflow();
        }
    }

    /// @dev Casts `x` to a int248. Reverts on overflow.
    function toInt248(int256 x) internal pure returns (int248) {
        unchecked {
            if (((1 << 247) + uint256(x)) >> 248 == uint256(0)) return int248(x);
            _revertOverflow();
        }
    }

    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*               OTHER SAFE CASTING OPERATIONS                */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

    /// @dev Casts `x` to a int8. Reverts on overflow.
    function toInt8(uint256 x) internal pure returns (int8) {
        if (x >= 1 << 7) _revertOverflow();
        return int8(int256(x));
    }

    /// @dev Casts `x` to a int16. Reverts on overflow.
    function toInt16(uint256 x) internal pure returns (int16) {
        if (x >= 1 << 15) _revertOverflow();
        return int16(int256(x));
    }

    /// @dev Casts `x` to a int24. Reverts on overflow.
    function toInt24(uint256 x) internal pure returns (int24) {
        if (x >= 1 << 23) _revertOverflow();
        return int24(int256(x));
    }

    /// @dev Casts `x` to a int32. Reverts on overflow.
    function toInt32(uint256 x) internal pure returns (int32) {
        if (x >= 1 << 31) _revertOverflow();
        return int32(int256(x));
    }

    /// @dev Casts `x` to a int40. Reverts on overflow.
    function toInt40(uint256 x) internal pure returns (int40) {
        if (x >= 1 << 39) _revertOverflow();
        return int40(int256(x));
    }

    /// @dev Casts `x` to a int48. Reverts on overflow.
    function toInt48(uint256 x) internal pure returns (int48) {
        if (x >= 1 << 47) _revertOverflow();
        return int48(int256(x));
    }

    /// @dev Casts `x` to a int56. Reverts on overflow.
    function toInt56(uint256 x) internal pure returns (int56) {
        if (x >= 1 << 55) _revertOverflow();
        return int56(int256(x));
    }

    /// @dev Casts `x` to a int64. Reverts on overflow.
    function toInt64(uint256 x) internal pure returns (int64) {
        if (x >= 1 << 63) _revertOverflow();
        return int64(int256(x));
    }

    /// @dev Casts `x` to a int72. Reverts on overflow.
    function toInt72(uint256 x) internal pure returns (int72) {
        if (x >= 1 << 71) _revertOverflow();
        return int72(int256(x));
    }

    /// @dev Casts `x` to a int80. Reverts on overflow.
    function toInt80(uint256 x) internal pure returns (int80) {
        if (x >= 1 << 79) _revertOverflow();
        return int80(int256(x));
    }

    /// @dev Casts `x` to a int88. Reverts on overflow.
    function toInt88(uint256 x) internal pure returns (int88) {
        if (x >= 1 << 87) _revertOverflow();
        return int88(int256(x));
    }

    /// @dev Casts `x` to a int96. Reverts on overflow.
    function toInt96(uint256 x) internal pure returns (int96) {
        if (x >= 1 << 95) _revertOverflow();
        return int96(int256(x));
    }

    /// @dev Casts `x` to a int104. Reverts on overflow.
    function toInt104(uint256 x) internal pure returns (int104) {
        if (x >= 1 << 103) _revertOverflow();
        return int104(int256(x));
    }

    /// @dev Casts `x` to a int112. Reverts on overflow.
    function toInt112(uint256 x) internal pure returns (int112) {
        if (x >= 1 << 111) _revertOverflow();
        return int112(int256(x));
    }

    /// @dev Casts `x` to a int120. Reverts on overflow.
    function toInt120(uint256 x) internal pure returns (int120) {
        if (x >= 1 << 119) _revertOverflow();
        return int120(int256(x));
    }

    /// @dev Casts `x` to a int128. Reverts on overflow.
    function toInt128(uint256 x) internal pure returns (int128) {
        if (x >= 1 << 127) _revertOverflow();
        return int128(int256(x));
    }

    /// @dev Casts `x` to a int136. Reverts on overflow.
    function toInt136(uint256 x) internal pure returns (int136) {
        if (x >= 1 << 135) _revertOverflow();
        return int136(int256(x));
    }

    /// @dev Casts `x` to a int144. Reverts on overflow.
    function toInt144(uint256 x) internal pure returns (int144) {
        if (x >= 1 << 143) _revertOverflow();
        return int144(int256(x));
    }

    /// @dev Casts `x` to a int152. Reverts on overflow.
    function toInt152(uint256 x) internal pure returns (int152) {
        if (x >= 1 << 151) _revertOverflow();
        return int152(int256(x));
    }

    /// @dev Casts `x` to a int160. Reverts on overflow.
    function toInt160(uint256 x) internal pure returns (int160) {
        if (x >= 1 << 159) _revertOverflow();
        return int160(int256(x));
    }

    /// @dev Casts `x` to a int168. Reverts on overflow.
    function toInt168(uint256 x) internal pure returns (int168) {
        if (x >= 1 << 167) _revertOverflow();
        return int168(int256(x));
    }

    /// @dev Casts `x` to a int176. Reverts on overflow.
    function toInt176(uint256 x) internal pure returns (int176) {
        if (x >= 1 << 175) _revertOverflow();
        return int176(int256(x));
    }

    /// @dev Casts `x` to a int184. Reverts on overflow.
    function toInt184(uint256 x) internal pure returns (int184) {
        if (x >= 1 << 183) _revertOverflow();
        return int184(int256(x));
    }

    /// @dev Casts `x` to a int192. Reverts on overflow.
    function toInt192(uint256 x) internal pure returns (int192) {
        if (x >= 1 << 191) _revertOverflow();
        return int192(int256(x));
    }

    /// @dev Casts `x` to a int200. Reverts on overflow.
    function toInt200(uint256 x) internal pure returns (int200) {
        if (x >= 1 << 199) _revertOverflow();
        return int200(int256(x));
    }

    /// @dev Casts `x` to a int208. Reverts on overflow.
    function toInt208(uint256 x) internal pure returns (int208) {
        if (x >= 1 << 207) _revertOverflow();
        return int208(int256(x));
    }

    /// @dev Casts `x` to a int216. Reverts on overflow.
    function toInt216(uint256 x) internal pure returns (int216) {
        if (x >= 1 << 215) _revertOverflow();
        return int216(int256(x));
    }

    /// @dev Casts `x` to a int224. Reverts on overflow.
    function toInt224(uint256 x) internal pure returns (int224) {
        if (x >= 1 << 223) _revertOverflow();
        return int224(int256(x));
    }

    /// @dev Casts `x` to a int232. Reverts on overflow.
    function toInt232(uint256 x) internal pure returns (int232) {
        if (x >= 1 << 231) _revertOverflow();
        return int232(int256(x));
    }

    /// @dev Casts `x` to a int240. Reverts on overflow.
    function toInt240(uint256 x) internal pure returns (int240) {
        if (x >= 1 << 239) _revertOverflow();
        return int240(int256(x));
    }

    /// @dev Casts `x` to a int248. Reverts on overflow.
    function toInt248(uint256 x) internal pure returns (int248) {
        if (x >= 1 << 247) _revertOverflow();
        return int248(int256(x));
    }

    /// @dev Casts `x` to a int256. Reverts on overflow.
    function toInt256(uint256 x) internal pure returns (int256) {
        if (int256(x) >= 0) return int256(x);
        _revertOverflow();
    }

    /// @dev Casts `x` to a uint256. Reverts on overflow.
    function toUint256(int256 x) internal pure returns (uint256) {
        if (x >= 0) return uint256(x);
        _revertOverflow();
    }

    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*                      PRIVATE HELPERS                       */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

    function _revertOverflow() private pure {
        /// @solidity memory-safe-assembly
        assembly {
            // Store the function selector of `Overflow()`.
            mstore(0x00, 0x35278d12)
            // Revert with (offset, size).
            revert(0x1c, 0x04)
        }
    }
}
