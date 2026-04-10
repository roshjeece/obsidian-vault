### 1. Define the Form Props Interface
Before building the component, define what data the form accepts as props
This is how a parent component passes data down to a child component

```tsx
import type {Task} from "./TaskType.ts";  
  
interface TaskFormProps {  
    initialTask?: Task;  
}
```
initialTask is optional(?) - this allows the same form to handle both create (no initial data) and edit (pre-populated) use cases

### 2. Creation of Initial Test for Task Form - Should Display Form Heading
```tsx
import {render, screen} from '@testing-library/react';  
import TaskForm from '../TaskForm.tsx';  
  
  
describe('Task Form', () => {  
    it('should display form heading', () => {  
        render(<TaskForm/>);  
        expect(screen.getByRole('heading', {name: /Task Form/i})).toBeInTheDocument();  
    })  
})
```

### Check to See if "Title" is in the Form Heading
```tsx
// TaskForm.tsx
export default function TaskForm({initialTask}: TaskFormProps) {  
    return (  
        <div>
	        <h2>Task Form</h2>  
	        <form>                
		        <label htmlFor={'Title'}>Title  
		            <input id={'Title'} type={'text'}/>  
                </label>
            </form>  
	    </div>  
    );  
};
```

```tsx
import {render, screen} from '@testing-library/react';  
import TaskForm from '../TaskForm.tsx';  
  
  
describe('Task Form', () => {  
    it('should display form heading', () => {  
        render(<TaskForm/>);  
        expect(screen.getByRole('heading', {name: /Task Form/i})).toBeInTheDocument();  
        expect(screen.getByLabelText(/Title/i)).toBeInTheDocument(); 
        expect(screen.getByRole('textbox', {name: /title/i})).toBeInTheDocument() 
    })  
})
```
1) Checking to make sure the heading "Task Form" exists
2) Checking to make sure that the Title label exists
3) Checking to make sure the textbox exists

Need:
1. Submit Button
2. Click Event