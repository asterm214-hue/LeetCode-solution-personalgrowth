from collections import defaultdict

class Solution:
    def countSubarrays(self, nums, k):
        pos = nums.index(k)

        count = defaultdict(int)
        balance = 0
        count[0] = 1

        # Left side (including k)
        for i in range(pos - 1, -1, -1):
            if nums[i] > k:
                balance += 1
            else:
                balance -= 1
            count[balance] += 1

        ans = count[0] + count[1]

        balance = 0

        # Right side
        for i in range(pos + 1, len(nums)):
            if nums[i] > k:
                balance += 1
            else:
                balance -= 1

            ans += count[-balance]
            ans += count[1 - balance]

        return ans