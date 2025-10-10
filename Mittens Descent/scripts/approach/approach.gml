/// @function approach(current, target, step)
/// @param current   The current value
/// @param target    The target value
/// @param step      The maximum amount to move
/// @returns         The new value after approaching

function approach(current, target, step) {
    if (current < target) {
        return min(current + step, target);
    } else {
        return max(current - step, target);
    }
}