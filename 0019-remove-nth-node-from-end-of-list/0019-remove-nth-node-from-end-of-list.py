# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:
        dummy  = ListNode(-1)
        dummy.next = head
        slow = dummy
        fast = dummy
        
        i = 1
        while( i <= n):
            fast = fast.next
            i = i + 1
            
        while(fast.next != None):
            fast = fast.next
            slow = slow.next
            
        slow.next = slow.next.next
        
        return dummy.next
        