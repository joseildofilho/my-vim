local fmta = require('luasnip.extras.fmt').fmta
local r = require('luasnip.extras').rep
local i = require('luasnip').insert_node
local s = require('luasnip').snippet

return {
    s(
        { trig = "producer", dscr = "creates a producer to golang CA starter" },
        fmta(
            [[
                type I<>Producer interface {
                	Publish(ctx context.Context, message *<>) error
                }

                type <>Producer  struct {
                	NotificationService messaging.NotificationMessageService
                }

                func New<>Producer() *<>Producer {
                	return &<>Producer{
                		NotificationService: messaging.NewNotificationMessageService(),
                	}
                }

                func (a *<>Producer) Publish(ctx context.Context, message *<>) error {
                	return a.NotificationService.Publish(ctx, nil)
                }
        ]],
            { i(1),
                i(2),
                r(1),
                r(1),
                r(1),
                r(1),
                r(1),
                r(2),
            })
    )
}
