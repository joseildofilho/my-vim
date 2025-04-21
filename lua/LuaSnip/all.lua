local fmta = require('luasnip.extras.fmt').fmta
local r = require('luasnip.extras').rep
local i = require('luasnip').insert_node
local s = require('luasnip').snippet

return {
    s(
        { trig = "create_gateway", dscr = "creates a Gateway for golang" },
        fmta([[
            package gateways

            import (
	            "os"

                "github.com/ContaAzul/ca-starters-go/web/restclient"
            )

            type I<>Gateway interface {}

            type <>Gateway struct {
            	client *restclient.RestClient
            }

            func New<>Gateway() *<>Gateway {
            	return &<>Gateway{
            		client: restclient.NewRestClient(&restclient.RestClientConfig{
            			Name:    "<>",
            			BaseURL: os.Getenv(""),
            			Timeout: 30,
            		})}
            }
    ]], {
            i(1),
            r(1),
            r(1),
            r(1),
            r(1),
            r(1),
        })
    ),
    s(
        { trig = "create_repo", dscr = "creates a Repository for golang" },
        fmta([[
            type I<>Repository interface {}

            type <>Repository struct{}

            func New<>Repository() *<>Repository {
            	return &<>Repository{}
            }
    ]], {
            i(1),
            r(1),
            r(1),
            r(1),
            r(1),
        })
    ),
    s(
        { trig = "build_mock", dscr = "creates a build_mock script for golang" },
        fmta("//go:generate build_mock", {})
    ),
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
    ),
    s("createUsecase", fmta([[
        type I<>Usecase interface {
            Execute(ctx context.Context) error
        }

        type <>Usecase struct {}

        func New<>Usecase() *<>Usecase {
            return &<>Usecase {}
        }

        func (u *<>Usecase) Execute(ctx context.Context) error {}
    ]], {
        i(1), -- Interface name
        r(1), -- Struct name
        r(1), -- Constructor name
        r(1), -- Constructor return
        r(1), -- Constructor return type struct
        r(1), -- Execute method bind
    })),
    s(
        { trig = "erre", dscr = "creates the if err != nil block" },
        fmta(
            [[
            if err != nil {
                return nil, err
            }
        ]],
            {}
        )
    ),
    s(
        { trig = "ere", dscr = "creates the if err != nil block" },
        fmta(
            [[
            if err != nil {
                return err
            }
        ]],
            {}
        )
    ),
    s(
        { trig = "ern", dscr = "creates the if err != nil block" },
        fmta(
            [[
            if err != nil {
                return nil
            }
        ]],
            {}
        )
    ),
    s(
        { trig = "errp", dscr = "creates the if err != nil block that panics" },
        fmta(
            [[
            if err != nil {
                panic(err)
            }
        ]],
            {}
        )
    ),
    s(
        { trig = 'controller', dscr = 'creates a controller to golang CA starter' },
        fmta(
            [[
            package controllers

            import "github.com/ContaAzul/ca-starters-go/web/restserver"

            type <>Controller struct {}

            func New<>Controller() *<>Controller {
                return &<>Controller {}
            }

            func (c *<>Controller) Routes() []restserver.Route {
                return []restserver.Route {}
            }
        ]]
            , {
                i(1),
                r(1),
                r(1),
                r(1),
                r(1),
            }
        )
    ),
    s(
        { trig = 'create_db_value', dscr = 'creates a db value type for golang' },
        fmta(
            [[
                type <> string

                func (v *<>) Scan(value any) error {
                	field, ok := value.(string)
                	if !ok {
                		return errors.New("When scanning <> from db, expected string, got: " + reflect.TypeOf(value).String())
                	}

                	*v = <>(field)
                	return nil
                }

                func (v <>) Value() (driver.Value, error) {
                	return v.String(), nil
                }

                func (v <>) String() string {
                	return string(v)
                }
    ]], {
                i(1),
                r(1),
                r(1),
                r(1),
                r(1),
                r(1),
            }
        )
    ),
    s(
        { trig = 'create_db_uuid_value', dscr = 'creates a db value type for golang' },
        fmta(
            [[
                type <> uuid.UUID

                func (v *<>) Scan(value any) error {
                	if value == nil {
                		return errors.New("<> cannot be created with nil")
                	}

                	field, ok := value.([]byte)
                	if !ok {
                		return errors.New("When scanning <> from db, expected string, got: " + reflect.TypeOf(value).String())
                	}

                	u, err := uuid.ParseBytes(field)
                	if err != nil {
                		return err
                	}
                	if u == uuid.Nil {
                		return errors.New("When scanning <> from db, expected string, got: " + reflect.TypeOf(value).String())
                	}

                	*v = <>(u)
                	return nil
                }

                func (v <>) Value() (driver.Value, error) {
                	return v.String(), nil
                }

                func (v <>) String() string {
                	return uuid.UUID(v).String()
                }]], {
                i(1),
                r(1),
                r(1),
                r(1),
                r(1),
                r(1),
                r(1),
                r(1),
            }
        )
    ),
    s({ trig = 'func Test_', dscr = 'creates a simple first test for golang' }, fmta(
        [[
            func Test_<>(t *testing.T) {
            	t.Run("should <>", func(t *testing.T) {
            	})
            }
    ]], { i(1), i(2) }
    )),
    s({ trig = 'tRun', dscr = 'creates a simple test case for golang' }, fmta(
        [[ t.Run("should <>", func(t *testing.T) {}) ]], { i(1) }
    )),
    s({ trig = "restclientrequest", dscr = "creates an http call" }, fmta([[
    response := restclient.Request[any, any]{
		Ctx:        ctx,
		Client:     g.client,
		HttpMethod: http...,
		Path:       "???",
		Headers: map[string]string{},
	}.Call()
    ]], {}))
}
