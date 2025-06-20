
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
	//++ Заитова 05.06.2025 Добавление команды пересчитывающей таблицу 	
	//Добавление команды формы
	КомандаПересчитатьТаблицу = Команды.Добавить("ПересчитатьТаблицу");
	КомандаПересчитатьТаблицу.Заголовок = "Пересчитать таблицу";
	КомандаПересчитатьТаблицу.Действие = "КомандаПересчитатьТаблицу";
	
	КнопкаФормы = Элементы.Добавить("ПересчитатьТаблицу", Тип("КнопкаФормы"), Элементы.ГруппаСкидка);
	КнопкаФормы.ИмяКоманды = "ПересчитатьТаблицу";
	КнопкаФормы.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	
	Скидка = Элементы.Найти("СогласованнаяСкидка");
	Если НЕ Скидка = Неопределено Тогда 
		//Скидка.УстановитьДействие("ПриИзменении", "ПересчитатьТаблицу");
		Скидка.УстановитьДействие("ОкончаниеВводаТекста", "СогласованнаяСкидкаОкончаниеВводаТекстаПосле");
	КонецЕсли;

    //-- Заитова
	
	
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

&НаКлиенте
Процедура ТоварыСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиСкидкаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура СогласованнаяСкидкаОкончаниеВводаТекстаПосле(Элемент, Текст, ДанныеВыбора, ПараметрыПолученияДанных, СтандартнаяОбработка)
	//++ Заитова 05.06.2025
	Режим = РежимДиалогаВопрос.ДаНет;
	Оповещение = Новый ОписаниеОповещения("ПослеЗакрытияВопроса", ЭтотОбъект, Параметры);
	ПоказатьВопрос(Оповещение, НСтр("ru = 'Изменен процент скидки. Пересчитать таблицы товаров и услуг?';"), Режим, 0);
	//-- Заитова 05.06.2025
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗакрытияВопроса(Результат, Параметры) Экспорт
	//++ Заитова 05.06.2025
	Если Результат = КодВозвратаДиалога.Да Тогда
		ПересчитатьТаблицу();	
	Иначе 
		Возврат;
	КонецЕсли;
	//-- Заитова 05.06.2025
 КонецПроцедуры

&НаКлиенте
Процедура ПересчитатьТаблицу()
	//++ Заитова 05.06.2025 Пересчитывание таблицы с учетом скидки
	
	//ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	Для Каждого Строка Из Объект.Товары Цикл 
		//РассчитатьСуммуСтрокиСоСкидкой(Строка);
		РассчитатьСуммуСтроки(Строка);	
	КонецЦикла;
	
	Для Каждого Строка Из Объект.Услуги Цикл 
		//РассчитатьСуммуСтрокиСоСкидкой(Строка);
		РассчитатьСуммуСтроки(Строка);
	КонецЦикла;
	
	//-- Заитова
КонецПроцедуры



&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
	
	КоэффициентСкидки = 1 - ТекущиеДанные.Скидка / 100;
	ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество * КоэффициентСкидки;
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

#КонецОбласти
