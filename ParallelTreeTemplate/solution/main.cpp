#include <iostream>
#include <memory>
#include <vector>
#include <chrono>

#include "ParallelTree.hpp"

using namespace std;

// Функция, которую мы максимизируем
int sum(const vector<int>& Cost)
{
    //cout << "!" << endl;
	int sum = 0;
	for (int i = 0; i < Cost.size(); i++)
		sum += Cost[i];
    return sum;
}
// Функция вывода массива
void print(const vector<int>& Cost)
{
	for (int i = 0; i < Cost.size(); i++)
		cout << Cost[i] << " ";
    cout << endl;
}

// Рекорд. Должен наследоваться от класса Record и реализовать методы
// betterThan и clone.
class ExampleRecord : public Record
{
public:
    ExampleRecord(vector<int> Cost) :
		Cost(Cost)
    {}
    
    // Вектор с решением
    vector<int> Cost;
    
    /*
     * Должна возвращать true, если данный рекорд лучше (меньше в задачах
     * минимизации и больше в задачах максимизации), чем other
     */
    bool betterThan(const Record& other) const override
    {
        const ExampleRecord& otherCast = static_cast<const ExampleRecord&>(other);
        // Поскольку у нас задача максимизации, то используем оператор "больше".
        return sum(Cost) > sum(otherCast.Cost);
    }
    
    // Должен возвращать копию данного рекорда.
    virtual std::unique_ptr<Record> clone() const override
    {
        // Здесь просто используем конструктор копий
        return std::make_unique<ExampleRecord>(*this);
    }
};

// Узел дерева вариантов. Должен наследоваться от класса Node и реализовать
// методы process и hasHigherPriority.
class ExampleNode : public Node
{
public:
	ExampleNode(const vector<int> Weight,const vector<int> Cost, 
		int CurrentWeight, vector<int> finalCost,const int MaxWeight, int lastIndex) :
		Weight(Weight),
		Cost(Cost),
		CurrentWeight(CurrentWeight),
		finalCost(finalCost),
		MaxWeight(MaxWeight),
		lastIndex(lastIndex)
    {}
    //Вектор веса предметов
    const vector<int> Weight;
	//Вектор цен предметов
    const vector<int> Cost;
	//Вектор с результатом (хранит цены предметов)
    vector<int> finalCost;
	//Текущий вес в рюкзаке
    int CurrentWeight;
	//Максимальный вес в рюкзаке
    const int MaxWeight;
    //Текущий индекс
    int lastIndex;
    
    /*
     * Функция, которая обрабатывает текущий узел и возвращает вектор
     * потомков этого узла (или пустой вектор, если потомков нет).
     * 
     * Она не должна менять глобальных переменных, т.к. она будет исполняться
     * в нескольких потоках. Рекорд менять можно (при этом синхронизация не
     * требуется).
     */
    virtual std::vector<std::unique_ptr<Node>> process(Record& record) override
    {
        ExampleRecord& recordCast = static_cast<ExampleRecord&>(record);
        // Потомки
        std::vector< std::unique_ptr<Node>> childNodes;
        // Если lastX достигнул предела массива, то мы дошли до листа дерева и потомков у текущего
        // узла нет.
        if(lastIndex == Cost.size())
        {
            // Если текущее решение лучше рекорда, то меняем рекорд
            if(sum(finalCost) > sum(recordCast.Cost))
                recordCast.Cost = finalCost;
            // Потомков нет. childNodes пуст.
            return childNodes;
        }
        else
        {
            
			for (int i = lastIndex; i < Cost.size(); i++)
			{
				// Если ограничение не выполняется, то отсекаем ветвь. Если ограничение выполнено, тогда помещаем в массив-результат
                // значение цены и создаем ветвь, после чего убираем из исходного массива finalCost значение.
				if (CurrentWeight + Weight[lastIndex] <= MaxWeight)
				{
                    finalCost[lastIndex] = Cost[lastIndex];
					childNodes.emplace_back(new ExampleNode(Weight, Cost,
						CurrentWeight + Weight[lastIndex],
						finalCost, MaxWeight, i + 1));
                    finalCost[lastIndex] = 0;
                }
			}
            return childNodes;
        }
    }
    
    /*
     * Возвращает true, если приоритет данного задания больше, чем other.
     * Задания с большим приоритетом будут обрабатываться раньше.
     */
    virtual bool hasHigherPriority(const Node& other) const
    {
        const ExampleNode& otherCast = static_cast<const ExampleNode&>(other);
        // Если у данного узда значение больше, то считаем что у него больше
        // приоритет.
        return sum(finalCost) > sum(otherCast.Cost);
    }
};


int main()
{
    //Входные параметры
	vector<int> Weight = { 0,5,5, 7, 10};
	vector<int> Cost =   { 0,3,10,10,11};
	vector<int> finalCost(Cost.size(),0);
	int MaxWeight = 17;
	// Инициализация рекорда
    ExampleRecord initialRecord(finalCost);
    // Корень дерева вариантов.
	unique_ptr<ExampleNode> root(new ExampleNode(Weight, Cost, 0, finalCost, MaxWeight, 0));
    auto startTime = chrono::high_resolution_clock::now();
    // Параллельно находим решение
    unique_ptr<ExampleRecord> bestRecord(static_cast<ExampleRecord*>(parallelTree(std::move(root),initialRecord,4).release()));
    auto finishTime = chrono::high_resolution_clock::now();
    auto duration = chrono::duration_cast<chrono::microseconds>(finishTime - startTime);
    
    cout << "Max cost: " << sum(bestRecord->Cost) << endl; 
    print(bestRecord->Cost);
    cout << "finished in " << duration.count() << " microseconds" << endl;
    
    return 0;
}