COMMENT ON TABLE person_discounts IS 'Таблица для хранения информации о персональных скидках';
COMMENT ON COLUMN person_discounts.id IS 'Основной индефекатор';
COMMENT ON COLUMN person_discounts.person_id IS 'Индефекатор клиента';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Индефекатор пиццерии';
COMMENT ON COLUMN person_discounts.discount IS 'Значение персональной скидки для клиента';