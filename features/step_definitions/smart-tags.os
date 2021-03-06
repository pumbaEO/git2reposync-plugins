#Использовать asserts

// Реализация шагов BDD-фич/сценариев c помощью фреймворка https://github.com/artbear/1bdd

Перем БДД; //контекст фреймворка 1bdd

// Метод выдает список шагов, реализованных в данном файле-шагов
Функция ПолучитьСписокШагов(КонтекстФреймворкаBDD) Экспорт
	БДД = КонтекстФреймворкаBDD;

	ВсеШаги = Новый Массив;

	ВсеШаги.Добавить("ТегДолженПрисутствоватьВРепозитории");

	Возврат ВсеШаги;
КонецФункции

// Реализация шагов

// Процедура выполняется перед запуском каждого сценария
Процедура ПередЗапускомСценария(Знач Узел) Экспорт
	
КонецПроцедуры

// Процедура выполняется после завершения каждого сценария
Процедура ПослеЗапускаСценария(Знач Узел) Экспорт
	
КонецПроцедуры

//Тег "1.0" должен присутствовать в репозитории
Процедура ТегДолженПрисутствоватьВРепозитории(Знач ОжидаемыйВыводКоманды) Экспорт
	

	ГитРепозиторий = БДД.ПолучитьИзКонтекста("ГитРепозиторий");
	ПутьКаталогаИсходников = БДД.ПолучитьИзКонтекста("ПутьКаталогаИсходников");
	ГитРепозиторий.УстановитьРабочийКаталог(ПутьКаталогаИсходников);

	ПараметрыКоманды = Новый Массив;
	ПараметрыКоманды.Добавить("tag");
	ПараметрыКоманды.Добавить("-l");
	ГитРепозиторий.ВыполнитьКоманду(ПараметрыКоманды);
	Вывод = ГитРепозиторий.ПолучитьВыводКоманды();

	Ожидаем.Что(Вывод).Содержит(ОжидаемыйВыводКоманды);

КонецПроцедуры

